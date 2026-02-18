//
//  SpecieViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation
import SwiftUI


@MainActor
public final class SpecieViewModel: ObservableObject {
    @Published var species: [Specie] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]

    private let getSpecieList: GetSpecieListByFilmUseCaseProtocol
    
    init(getSpecieList: GetSpecieListByFilmUseCaseProtocol) {
        self.getSpecieList = getSpecieList
    }
    
    func getSpecies(filmSpecieUrl: [String]) async {
        let result = await getSpecieList.execute(filmSpecieUrl: filmSpecieUrl)
        
        guard case .success(let species) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
        
        self.species = species
        isLoading = false
    }
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
}
