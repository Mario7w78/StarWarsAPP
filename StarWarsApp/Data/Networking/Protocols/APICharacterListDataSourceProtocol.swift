//
//  APICharacterListDataSourceProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol APICharacterListDataSourceProtocol {
    func getCharacterList() async -> Result<CharacterResponseDTO, HTTPClientError>
}



