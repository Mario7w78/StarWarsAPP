//
//  GetSpecieListByFilmUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol GetSpecieListByFilmUseCaseProtocol {
    func execute( filmSpecieUrl: [String] ) async -> Result<[Specie], StarWarsDomainError>
}


