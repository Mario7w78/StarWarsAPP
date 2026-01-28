//
//  FilmsView.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI


struct FilmListView: View {
    @State var films: [Film] = []
    @State var isLoading: Bool = true
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("FILMS")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                    
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(films, id: \.episodeId){film in
                                NavigationLink(destination: FilmDetailView(film: film)){
                                    FilmPreview(title: film.title, episode: film.episodeId)
                                }
                            }
                            
                        }.padding(.horizontal, 20)
                    }
                    .frame(height: 500)
                }
                .onAppear {
                    Task{
                        do {
                            let wrappedFilms = try await getFilms()
                            films = wrappedFilms.results
                        }catch{
                            print("ono")
                        }
                        isLoading = false
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .tint(.white)
                        
                }
            }
        }
    }
}

#Preview {
    FilmListView()
}
