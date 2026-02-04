//
//  FilmDetail.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    let filmImage: String
    var body: some View {
        TabView{
            Group {
                FilmInfoView(film: film, filmImageName: filmImage)
                    .tabItem { Label("Home", systemImage: "house")}
                VehicleListView(film: film.vehicles)
                    .tabItem { Label("Vehicles", systemImage: "paperplane.fill")}
                SpecieGridView( film: film.species)
                    .tabItem { Label("Species", systemImage: "person.2.fill")}
                PlanetListView(film: film.planets, filter: true)
                    .tabItem { Label("Planets", systemImage: "globe")}
            }
            .toolbarBackground(.black, for: .tabBar)
        }
        .tint(.swFont)
        
        
        
    }
}


#Preview {
    FilmDetailView(film: Film(title: "String", episodeId: 1, openingCrawl: "It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....", director: "String", producer: "TU", releaseDate: "TU", characters: ["String"], planets: ["String"], starships: ["String"], vehicles: ["String"], species: ["String"], url: "ola"), filmImage: "ANewHope")
}
