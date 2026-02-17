//
//  Film.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation


struct FilmResponseDTO: Decodable {
    let count: Int
    let results: [Film]
    
    struct Film: Decodable {
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
        let url: String
        
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
            case url = "url"
        }
    }
}



