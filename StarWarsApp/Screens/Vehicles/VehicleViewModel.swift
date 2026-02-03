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
    
    
    func getVehicles(film: [String]) async {
        
        do{
            vehicles = try await NetworkManager.shared.getVehiclesByFilm(filmVehicleUrl: film)
        }
        catch{
            print("Error: \(error)")
        }
        isLoading = false
    }
}
