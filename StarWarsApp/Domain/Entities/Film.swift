//
//  Film.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

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
}
