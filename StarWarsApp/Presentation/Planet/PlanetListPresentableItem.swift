    //
//  FilmListPresentableItem.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

struct PlanetListPresentableItem: Hashable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    
    init(domainModel: Planet) {
        self.name = domainModel.name
        self.rotationPeriod = domainModel.rotationPeriod
        self.orbitalPeriod = domainModel.orbitalPeriod
        self.diameter = domainModel.diameter
        self.climate = domainModel.climate
        self.gravity = domainModel.gravity
        self.terrain = domainModel.terrain
        self.surfaceWater = domainModel.surfaceWater
        self.population = domainModel.population
        self.residents = domainModel.residents
    }
}
