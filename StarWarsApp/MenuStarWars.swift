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
                        .padding(.bottom, 50)
                    
                    HStack(spacing: 60){
                        
                        NavigationLink(destination: FilmListView()){
                            
                            LabelButton(title: "Film Info", imageName: "info.circle")
                            
                        }
                        
                        
                        NavigationLink(destination: SearchBarView()){
                            
                            LabelButton(title: "Search", imageName: "magnifyingglass")
                            
                        }
                        
                        
                        
                    }.foregroundStyle(.swFont)
                }
            }
        }
    }
}

#Preview {
    MenuStarWars()
}
