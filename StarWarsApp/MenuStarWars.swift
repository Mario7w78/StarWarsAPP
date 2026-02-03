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
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.white, lineWidth: 3)
                                .frame(width: 200, height: 50)
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
}

#Preview {
    MenuStarWars()
}
