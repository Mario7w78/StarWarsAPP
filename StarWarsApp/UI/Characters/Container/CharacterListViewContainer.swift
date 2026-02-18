//
//  CharacterListViewContainer.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//

import Foundation
import SwiftUI

struct CharacterListViewContainer: View {
    
    @DependencyContainer(\.useCaseFactory) private var useCaseFactory
    let charactersURL: [String]
    var body: some View {
        CharacterListView(
            viewModel: CharacterViewModel(getCharacterList: useCaseFactory.getCharactersBySpeciesUseCase()), charactersURL: charactersURL
        )
    }
}
