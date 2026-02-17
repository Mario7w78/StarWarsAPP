//
//  PlanetDetailView.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct PlanetDetailView: View {
    let planet: Planet
    var body: some View {
        ZStack{
            Color(.swBg).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text(planet.name)
                    .font(.title)
                    .foregroundStyle(.white)
                
                ScrollView(.vertical, showsIndicators: false){
                    GroupBox("Properties"){
                        Text("Gravity: \(planet.gravity)")
                        Text("Rotation Period: \(planet.rotationPeriod)")
                        Text("Orbital Period: \(planet.orbitalPeriod)")
                        Text("Diameter: \(planet.diameter)")
                        Text("Climate: \(planet.climate)")
                    }
                    
                    GroupBox("Geography"){
                        Text("Biomes: \(planet.terrain)")
                        Text("Surface Water: \(planet.surfaceWater)")
                    }
                    
                    GroupBox("Population"){
                        Text("Habitants: \(planet.population)")
                    }
                }
                .frame(height: 400)
                
                    
            }
            
        }
    }
}

#Preview {
    PlanetDetailView(planet: Planet(
        name: "Tatooine",
        rotationPeriod: "23",
        orbitalPeriod: "304",
        diameter: "10465",
        climate: "arid",
        gravity: "1 standard",
        terrain: "desert",
        surfaceWater: "1",
        population: "200000",
        residents: [
            "https://swapi.dev/api/people/1/",
            "https://swapi.dev/api/people/2/"
        ]
    ))
}
