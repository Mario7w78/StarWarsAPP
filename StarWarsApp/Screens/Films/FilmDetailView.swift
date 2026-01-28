//
//  FilmDetail.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                VStack{
                    
                    Text(film.title)
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text("Release: \(film.releaseDate)")
                        .foregroundStyle(.white)
                        .font(.caption2)
                        .bold()
                        .padding(.bottom, 20)
                    
                    
                    VStack{
                        VStack{
                            Text("Episode \(film.episodeId)")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .bold()
                            
                            Text(film.openingCrawl)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(.top, 2)
                            
                            VStack(alignment: .leading)
                            {
                                Label("Director: \(film.director)", systemImage: "person.fill")
                                    .font(.caption2)
                                    .foregroundStyle(.white)
                                
                                Label("Producer: \(film.producer)", systemImage: "person.fill")
                                    .font(.caption2)
                                    .foregroundStyle(.white)
                            }
                            .padding(.top)
                            
                        }
                        .frame(width: 300)
                        
                        
                        HStack(spacing: 20){
                            
                            NavigationLink(destination: PlanetListView(film: film.planets, filter: true)){
                                LabelButton(title: "Planets", imageName: "globe.americas.fill")
                            }
                            NavigationLink(destination: {}){
                                LabelButton(title: "Species", imageName: "person.2.fill")
                            }
                            NavigationLink(destination: {}){
                                LabelButton(title: "Vehicles", imageName: "paperplane.fill")
                            }
                            
                        }
                        .padding(.top, 50)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FilmDetailView(film: Film(title: "String", episodeId: 1, openingCrawl: "It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....", director: "String", producer: "TU", releaseDate: "TU", characters: ["String"], planets: ["String"], starships: ["String"], vehicles: ["String"], species: ["String"]))
}
