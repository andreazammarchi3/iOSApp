//
//  PlaceListView.swift
//  Travels
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import SwiftUI

/// View for the HomePage, showing the list of item
struct PlaceListView: View {
    @ObservedObject var viewModel: DataLoader
    
    @State var showAddPlaceView = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default)
    private var placesCoredata: FetchedResults<PlaceEntity>
    
    var places: [Place] {
        var list = viewModel.places
        for place in placesCoredata {
            list.append(place.convertToPlace())
        }
        list.sort {
            $0.id > $1.id
        }

        UserDefaults.standard.set(list.first?.id ?? 0, forKey: "lastID")
        return list
    }
    
    var body: some View {
        NavigationView {
            //List(places) { place in
            List {
                ForEach(places) {place in
                    NavigationLink(
                        destination: PlaceDetailsView(place: place, viewModel: viewModel)) {
                        PlaceRowView(viewModel: viewModel, place: place)
                    }
                }.onDelete { indexSet in
                    var itemsToRemove = [PlaceEntity]()
                    for indexToRemove in indexSet {
                        itemsToRemove.append(contentsOf: placesCoredata.filter { item in
                            item.id == places[indexToRemove].id
                        })
                        viewModel.deleteItems(places: itemsToRemove, viewContext: viewContext)
                    }
                }
            }.navigationTitle("Places")
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            //viewModel.addItem(viewContext: viewContext)
                            showAddPlaceView = true
                        }, label: {
                            Label("Add Item", systemImage: "plus")
                        })
                    }
                }
                .sheet(isPresented: $showAddPlaceView) {
                    AddPlaceView(viewModel: viewModel)
                        .environment(\.managedObjectContext, viewContext)
                }
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(viewModel: DataLoader())
    }
}
