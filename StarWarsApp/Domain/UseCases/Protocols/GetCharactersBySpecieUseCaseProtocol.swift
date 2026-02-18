//
//  GetCharactersBySpecieUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol GetCharactersBySpecieUseCaseProtocol {
    func execute(specieUrl:[String]) async -> Result<[Character], StarWarsDomainError>
}
