//
//  PlanetMenu.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct PlanetListView: View {
    
    @ObservedObject private var viewModel: PlanetViewModel
    let film : [String]
    
    init(viewModel: PlanetViewModel, film : [String]){
        self.viewModel = viewModel
        self.film = film
    }

    var body: some View {
        NavigationStack{
            ZStack{
                Color(.swBg)
                    .ignoresSafeArea()
                VStack(){
                    Text("PLANETS")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold(true)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(){
                            ForEach(viewModel.planets, id: \.name) { planet in
                                NavigationLink(destination: PlanetDetailView(planet: planet)){
                                    Preview(text: planet.name, imageName: "globe.americas.fill")
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                }
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.white)
                }
            }
            .task{await viewModel.getPlanets(filmPlanetUrl: film)}
            
            
        }
        
    }
    
}



//#Preview {
//    PlanetListView(film: ["https://swapi.dev/api/planets/4/"], filter: true)
//}
