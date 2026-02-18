//
//  PlanetViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation


@MainActor
final class PlanetViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var isLoading: Bool = true
    
    private let getPlanetList: GetPlanetListByFilmUseCaseProtocol
    
    init(getPlanetList: GetPlanetListByFilmUseCaseProtocol) {
        self.getPlanetList = getPlanetList
    }
    
    func getPlanets(filmPlanetUrl: [String]) async {
        let result = await getPlanetList.execute(filmPlanetUrl: filmPlanetUrl)
        
        guard case .success(let planets) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
        
        self.planets = planets
        isLoading = false
    }
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
}
