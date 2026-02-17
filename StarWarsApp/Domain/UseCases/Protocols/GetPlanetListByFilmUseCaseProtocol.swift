//
//  GetPlanetListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol GetPlanetListUseCaseProtocol {
    func execute() async -> Result<[Planet], StarWarsDomainError>
}
