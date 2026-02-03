//
//  CharacterDetailVIew.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import SwiftUI

struct CharacterDetailView: View {
    let character : Character
    var body: some View {
        ZStack{
            Color(.swBg)
                .ignoresSafeArea()
                
            VStack{
                HStack(spacing: 40) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        
                    VStack(alignment: .leading, spacing: 10){
                        Text(character.name)
                            .font(.title2.bold())
                        Text("Height: \(character.height) cm")
                        Text("Weight: \(character.mass) kg")
                        Text("Hair Color: \(character.hairColor)")
                        Text("Skin Color: \(character.skinColor)")
                        Text("Eye Color: \(character.eyeColor)")
                        Text("Birth Year: \(character.birthYear)")
                        Text("Gender: \(character.gender)")
                        
                    }
                    .frame(height: 300)
                }
                .padding(.horizontal, 35)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                
            }
            .foregroundStyle(.white)

        }
      
            
        
    }
}

#Preview {
    CharacterDetailView(character: Character(
        name: "Luke Skywalker",
        height: "172",
        mass: "77",
        hairColor: "blond",
        skinColor: "fair",
        eyeColor: "blue",
        birthYear: "19BBY",
        gender: "male"
    ))
}
