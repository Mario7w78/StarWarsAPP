//
//  SpecieViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation
import SwiftUI


@MainActor public final class SpecieViewModel: ObservableObject {
    
    
    @Published var species: [Specie] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    func getSpecies(film: [String]) async throws{
            do{
                
                species = try await NetworkManager.shared.getSpeciesByFilm(filmSpecieUrl: film)
                
//                guard case .success(let data) = species else { return }
            }catch{
                print("Error: \(error)")
            }
            isLoading = false
    }
}
