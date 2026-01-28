//
//  PlanetModel.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import Foundation

struct WrappedPlanets: Decodable {
    let results: [Planet]
}

struct Planet: Decodable {
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
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter = "diameter"
        case climate = "climate"
        case gravity = "gravity"
        case terrain = "terrain"
        case surfaceWater = "surface_water"
        case population = "population"
        case residents = "residents"
    }
    
}


func getPlanets() async throws -> [Planet]{
    let url = URL(string: "https://swapi.dev/api/planets/")
    
    let (data, _) = try await URLSession.shared.data(from: url!)
    
    let wrappedPlanets = try JSONDecoder().decode(WrappedPlanets.self, from: data)
    return wrappedPlanets.results
}


func getPlanetsByFilm(filmPlanetUrl: [String]) async throws -> [Planet]{
    var planets: [Planet] = []
    
    for url in filmPlanetUrl {
        let urlString = URL(string: url)!
        let (data, _) = try await URLSession.shared.data(from: urlString)
        let planet = try JSONDecoder().decode(Planet.self, from: data)
        planets.append(planet)
    }
    
    return planets
}
