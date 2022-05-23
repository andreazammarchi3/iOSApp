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
        return list
    }
    
    var body: some View {
        NavigationView {
            List(places) { place in
                NavigationLink(
                    destination: PlaceDetailsView(place: place, viewModel: viewModel)) {
                    PlaceRowView(viewModel: viewModel, place: place)
                }
            }.navigationTitle("Places")
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            viewModel.addItem(viewContext: viewContext)
                            
                        }, label: {
                            Label("Add Item", systemImage: "plus")
                        })
                    }
                }
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(viewModel: DataLoader())
    }
}
