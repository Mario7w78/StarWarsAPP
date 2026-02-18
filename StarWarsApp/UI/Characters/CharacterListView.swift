//
//  CharacterListView.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterViewModel
    private let charactersURL: [String]
    
    init( viewModel: CharacterViewModel, charactersURL: [String]){
        self.viewModel = viewModel
        self.charactersURL = charactersURL
    }
    
    var body: some View {
        ZStack{
            VStack(){
                ScrollView(
                    .horizontal
                ) {
                    LazyHStack(){
                        ForEach(
                            viewModel.characters,
                            id: \.name
                        ) { character in
                            Preview(
                                text: character.name,
                                imageName: "person.fill"
                            )
                            .onTapGesture {
                                viewModel.currentCharacter = character
                            }
                        }
                    }
                }
            }
            .task {
                await viewModel.getCharacters(
                    specieUrl: charactersURL
                )
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(
                        .white
                    )
            }
        }
        .frame(
            height: 200
        )
        .sheet( item: $viewModel.currentCharacter
        ){ character in
            CharacterDetailView(
                character: character
            )
            .presentationDetents(
                [.medium]
            )
            .presentationDragIndicator(
                .visible
            )
        }
        
        
    }
}

//#Preview {
//    CharacterListView(
//        charactersURL: ["https://swapi.dev/api/people/1"]
//    )
//}
//
