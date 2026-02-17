//
//  CharacterViewModel.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation

@MainActor public final class CharacterViewModel: ObservableObject {
    
    
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = true
    @Published var currentCharacter: Character?
    
    
    func getCharacters(charactersURL: [String]) async {
        
        do{
            characters = try await NetworkManager.shared.getCharactersBySpecie(charactersURL: charactersURL)
        }
        catch {
            print("Error: \(error)")
        }
        isLoading = false
        
    }
    
    
}
