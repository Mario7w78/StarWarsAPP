//
//  PlanetViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation


@MainActor public final class PlanetViewModel: ObservableObject {
    
    @Published var planets: [Planet] = []
    @Published var isLoading: Bool = true
    
    func getPlanets(film: [String], filter: Bool) async {
        do{
            if filter {
                planets = try await NetworkManager.shared.getPlanetsByFilm(filmPlanetUrl: film)
            }
            else {
                planets = try await NetworkManager.shared.getPlanets()
            }
        }
        catch {
            print("Error: \(error)")
        }
        isLoading = false
        
    }
    
}
