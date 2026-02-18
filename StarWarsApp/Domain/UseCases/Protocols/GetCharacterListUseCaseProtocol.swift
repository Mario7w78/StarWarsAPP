//
//  GetCharacterListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol GetCharacterListUseCaseProtocol {
    func execute() async -> Result<[Character], StarWarsDomainError>
}




