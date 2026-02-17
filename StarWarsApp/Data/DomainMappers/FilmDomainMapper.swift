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
        filmResponseDTO.results.forEach{film in
            films.append(
            Film(
                title: film.title,
                episodeId: film.episodeId,
                openingCrawl: film.openingCrawl,
                director: film.director,
                producer: film.producer,
                releaseDate: film.releaseDate,
                characters: film.characters,
                planets: film.planets,
                starships: film.starships,
                vehicles: film.vehicles,
                species: film.species,
                url: film.url
                ))
        }
        return films
    }
}
