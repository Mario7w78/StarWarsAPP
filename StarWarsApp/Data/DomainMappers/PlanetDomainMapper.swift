    //
//  FilmDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class PlanetDomainMapper {
    func map(planetResponseDTO: PlanetResponseDTO) -> [Planet] {
        var planets : [Planet] = []
        planetResponseDTO.results.forEach{planet in
            planets.append(
            Planet(
                name: planet.name,
                rotationPeriod: planet.rotationPeriod,
                orbitalPeriod: planet.orbitalPeriod,
                diameter: planet.diameter,
                climate: planet.climate,
                gravity: planet.gravity,
                terrain: planet.terrain,
                surfaceWater: planet.surfaceWater,
                population: planet.population,
                residents: planet.residents
            )
        )
        }
        return planets
    }
}
