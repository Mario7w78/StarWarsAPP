//
//  VehicleViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation


@MainActor public final class VehicleViewModel: ObservableObject {
    
    @Published var vehicles: [Vehicle] = []
    @Published var isLoading: Bool = true
    
    private let getVehicleList: GetVehicleByFilmUseCaseProtocol
    
    init(getVehicleList: GetVehicleByFilmUseCaseProtocol) {
        self.getVehicleList = getVehicleList
    }
    
    func getVehicles(filmVehicleUrl: [String]) async {
        let result = await getVehicleList.execute(filmVehicleUrl: filmVehicleUrl)
        
        guard case .success(let vehicles) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
        
        self.vehicles = vehicles
        isLoading = false
    }
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
}
