//
//  GetSpecieListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol GetSpecieListUseCaseProtocol {
    func execute() async -> Result<[Specie], StarWarsDomainError>
}