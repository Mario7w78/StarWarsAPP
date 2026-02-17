//
//  FilmListPresentableItem.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

struct FilmListPresentableItem: Hashable {
    let title: String
    let episodeId: String
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
    
    init(domainModel: Film) {
        self.title = domainModel.title
        self.episodeId = String(domainModel.episodeId)
        self.openingCrawl = domainModel.openingCrawl
        self.director = domainModel.director
        self.producer = domainModel.producer
        self.releaseDate = domainModel.releaseDate
        self.characters = domainModel.characters
        self.planets = domainModel.planets
        self.vehicles = domainModel.vehicles
        self.starships = domainModel.starships
        self.species = domainModel.species
        self.url = domainModel.url
    }
}
