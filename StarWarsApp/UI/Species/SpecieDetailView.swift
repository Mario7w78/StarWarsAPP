//
//  SpecieDetailView.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import SwiftUI

struct SpecieDetailView: View {
    let specie: Specie
    var body: some View {
        ZStack{
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                
                Text(specie.name).font(.largeTitle.bold())
                VStack{
                    Text("Language:  \(specie.language)")
                    Text("Designation: \(specie.designation)")
                    Text("Lifespan: \(specie.averageLifespan)")
                }
                .padding(.vertical )
                .frame(maxWidth: .infinity)
                .font(.title3.bold())
                .background(.gray.opacity(0.2))
                
                
            
                VStack{
                    Section(header: Text("Appearance").font(.title2.bold())){
                        SpacedRow(title: "Average Height", value: "\(specie.averageHeight) cm", imageName: "ruler")
                        SpacedRow(title: "Classification", value: specie.classification, imageName: "poweroutlet.type.b.fill")
                        SpacedRow(title: "Skin Colors", value: specie.skinColors, imageName: "circle.fill")
                        SpacedRow(title: "Hair Colors", value: specie.hairColors, imageName: "road.lanes.curved.left")
                        SpacedRow(title: "Eye Colors", value: specie.eyeColors, imageName: "eye.fill")
                    }
                }
                
                VStack{
                    Text("Characters")
                        .font(.title2.bold())
                    CharacterListView(charactersURL: specie.people)
                        .presentationDetents([.medium, .medium])
                }
                
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
        
        
        
    }
}

#Preview {
    SpecieDetailView(specie: Specie(
        name: "Human",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "180",
        skinColors: "caucasian, black, asian, hispanic",
        hairColors: "blonde, brown, black, red",
        eyeColors: "brown, blue, green, hazel, grey, amber,",
        averageLifespan: "120",
        language: "Galactic Basic",
        people: [
            "https://swapi.dev/api/people/66/",
            "https://swapi.dev/api/people/67/",
            "https://swapi.dev/api/people/68/",
            "https://swapi.dev/api/people/74/"
        ]))
}
