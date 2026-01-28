//
//  PlanetMenu.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct PlanetListView: View {
    
    let film : [String]
    let filter: Bool
    @State var planets: [Planet] = []
    @State var isLoading: Bool = true
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                VStack(){
                    Text("PLANETS")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold(true)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(){
                            ForEach(planets, id: \.name) { planet in
                                NavigationLink(destination: PlanetDetailView(planet: planet)){
                                    PlanetPreview(planetName: planet.name)
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                }
                if isLoading {
                    ProgressView()
                        .tint(.white)
                }
            }
            .onAppear{
                Task{
                    do{
                        if filter {
                            planets = try await getPlanetsByFilm(filmPlanetUrl: film)
                        }
                        else {
                            planets = try await getPlanets()
                        }
                    }
                    catch {
                        print("Error: \(error)")
                    }
                    isLoading = false
                }
            }
            
            
        }
        
    }
    
}



#Preview {
    PlanetListView(film: ["https://swapi.dev/api/planets/4/"], filter: true)
}
