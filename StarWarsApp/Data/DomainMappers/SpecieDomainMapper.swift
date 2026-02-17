//
//  FilmDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class SpecieDomainMapper {
    func map(specieResponseDTO: SpecieResponseDTO) -> [Specie] {
        var species : [Specie] = []
        specieResponseDTO.results.forEach{specie in
            species.append(
                Specie(name: specie.name,
                       classification: specie.classification,
                       designation: specie.designation,
                       averageHeight: specie.averageHeight,
                       skinColors: specie.skinColors,
                       hairColors: specie.hairColors,
                       eyeColors: specie.eyeColors,
                       averageLifespan: specie.averageLifespan,
                       language: specie.language,
                       people: specie.people,
                       url: specie.url
                      )
                )
        }
        return species
    }
}
