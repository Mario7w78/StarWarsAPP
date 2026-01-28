//
//  PlanetModel.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import Foundation


struct WrappedFilms: Codable {
    let count: Int
    let results: [Film]
}


struct Film: Codable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters : [String]
    let planets : [String]
    let starships : [String]
    let vehicles : [String]
    let species : [String]
    
    
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
        case title = "title"
        case director = "director"
        case producer = "producer"
        case characters = "characters"
        case planets = "planets"
        case starships = "starships"
        case vehicles = "vehicles"
        case species = "species"
    }
    
}


func getFilms() async throws -> WrappedFilms{
    let url = URL(string: "https://swapi.dev/api/films/")
    
    let (data, _) = try await URLSession.shared.data(from: url!)
    
    let filmsWrapped = try JSONDecoder().decode(WrappedFilms.self, from: data)
        return filmsWrapped
    
}



