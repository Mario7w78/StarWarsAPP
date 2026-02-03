//
//  FilmsView.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct FilmListView: View {
    @StateObject var viewModel = FilmViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.swBg)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(viewModel.films, id: \.episodeId){film in
                                
                                let filmImageName: String = viewModel.getImageName(episode: film.episodeId)
                                
                                NavigationLink(destination: FilmDetailView(film: film, filmImage: filmImageName )){
                                    FilmPreview(title: film.title, episode: film.episodeId, filmImage: filmImageName)
                                }
                            }
                            
                        }.padding(.horizontal, 20)
                    }
                    .frame(height: 550)
                    .scrollIndicators(.hidden)
                }
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.white)
                    
                }
            }
            .task { await viewModel.getFilms() }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Films")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    FilmListView()
}



