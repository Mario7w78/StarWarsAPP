//
//  GetFilmListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol GetFilmListUseCaseProtocol {
    func execute() async -> Result<[Film], StarWarsDomainError>
}