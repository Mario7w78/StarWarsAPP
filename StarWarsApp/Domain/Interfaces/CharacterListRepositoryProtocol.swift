//
//  CharacterListRepositoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol CharacterListRepositoryProtocol {
    func getCharacterList() async -> Result<[Character], StarWarsDomainError>
}


