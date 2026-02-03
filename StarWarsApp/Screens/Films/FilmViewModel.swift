//
//  FilmViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation

@MainActor public final class FilmViewModel: ObservableObject {
    @Published var films: [Film] = []
    @Published var isLoading: Bool = true
    
    
    
    func getFilms() async {
        do {
            let filmsResponse = try await NetworkManager.shared.getFilms()
            
            films = filmsResponse.results.sorted(by: {$0.episodeId < $1.episodeId})
            
        }catch{
            print("Error: \(error)")
        }
        isLoading = false
    }
    
    
    func getImageName(episode: Int) -> String {
        switch episode {
        case 1:
            return "ThePhantomMenace"
        case 2:
            return "AttackOfTheClones"
        case 3:
            return "RevengeOfTheSith"
        case 4:
            return "ANewHope"
        case 5:
            return "TheEmpireStrikesBack"
        case 6:
            return "ReturnOfTheJedi"
        default:
            return "ANewHope"
        }
    }
    
}
