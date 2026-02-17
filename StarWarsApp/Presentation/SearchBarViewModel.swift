//
//  SearchBarViewmodel.swift
//  StarWarsApp
//
//  Created by Mario on 4/02/26.
//

import Foundation
import SwiftUI


struct ListItemFilter: Identifiable {
    var id: UUID = UUID()
    let title: String
    let detailUrl: String
}
enum FilterError{
    
}

@MainActor
public final class SearchBarViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var filteredList: [ListItemFilter] = []
    
    let FilterKeys: [String] = ["Films", "Characters", "Planets", "Species", "Vehicles", "Starships"]
    
    func searchFilterFetch(key: String) async throws {
        var listItem: [ListItemFilter] = []
        switch key {
            
        case "Films":
            
            let data = try await NetworkManager.shared.getFilms()
            
            for item in data.results {
                listItem.append(ListItemFilter(title: item.title, detailUrl: item.url))
            }
            
        case "Characters":
            let data = try await NetworkManager.shared.getCharacters()
            
            
            
        default:
            print("o")
        }
        
        
        filteredList = listItem
    }
    
}

