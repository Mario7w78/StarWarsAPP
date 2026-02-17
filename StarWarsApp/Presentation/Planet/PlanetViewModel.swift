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
    
    private let getPlanetList: GetPlanetListUseCaseProtocol
    
    init(getPlanetList: GetPlanetListUseCaseProtocol) {
        self.getPlanetList = getPlanetList
    }
    
    func getPlanets() async {
        let result = await getPlanetList.execute()
        guard case .success(let planets) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
    }
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
}
