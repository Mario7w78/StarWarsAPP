//
//  FilmDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class FilmDomainMapper {
    func map(filmResponseDTO: FilmResponseDTO) -> [Film] {
        var films : [Film] = []
        filmResponseDTO.results.forEach{films.append(
            Film(
                title: $0.title,
                episodeId: $0.episodeId,
                openingCrawl: $0.openingCrawl,
                director: $0.director,
                producer: $0.producer,
                releaseDate: $0.releaseDate,
                characters: $0.characters,
                planets: $0.planets,
                starships: $0.starships,
                vehicles: $0.vehicles,
                species: $0.species,
                url: $0.url
                ))
        }
        return films
    }
}
