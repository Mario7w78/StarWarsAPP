//
//  ContentView.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct MenuStarWars: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                VStack{
                    
                    Image("starwarsLogo")
                        .resizable()
                        .frame(height: 200)
                        .padding()
                    NavigationLink(destination: FilmListView()) {
                        Text("START")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    MenuStarWars()
}
