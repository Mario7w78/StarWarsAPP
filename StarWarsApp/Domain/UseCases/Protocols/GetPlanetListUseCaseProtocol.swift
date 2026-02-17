//
//  GetPlanetListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol GetPlanetListByFilmUseCaseProtocol {
    func execute( filmPlanetUrl: [String] ) async -> Result<[Planet], StarWarsDomainError>
}
