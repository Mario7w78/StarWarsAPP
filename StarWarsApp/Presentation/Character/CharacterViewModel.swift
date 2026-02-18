//
//  CharacterViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = true
    @Published var currentCharacter: Character?
    
    private let getCharacterList: GetCharactersBySpecieUseCaseProtocol
    
    init(getCharacterList: GetCharactersBySpecieUseCaseProtocol) {
        self.getCharacterList = getCharacterList
    }
    
    func getCharacters(specieUrl: [String]) async {
        let result = await getCharacterList.execute(specieUrl: specieUrl)
        
        guard case .success(let characters) = result else {
            handleError(error: result.failureValue as? StarWarsDomainError)
            return
        }
        self.characters = characters
        isLoading = false
    }
    
    private func handleError(error: StarWarsDomainError?){
        Task {
            isLoading = false
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
}
