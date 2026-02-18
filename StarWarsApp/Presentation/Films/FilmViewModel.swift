//
//  FilmViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation

@MainActor
final class FilmViewModel: ObservableObject {
    @Published var films: [Film] = []
    @Published var isLoading: Bool = true
    @Published var showErrorMessage: String?

    private let getFilmList: GetFilmListUseCaseProtocol
    
    init(getFilmList: GetFilmListUseCaseProtocol) {
        self.getFilmList = getFilmList
    }
    
    func getFilms() async {
        let result = await getFilmList.execute()
        
        guard case .success(let films) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
        
        self.films = films
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
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
    
}

