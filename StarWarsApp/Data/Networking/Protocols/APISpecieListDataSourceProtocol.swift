//
//  APIPlanetListDataSourceProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol APISpecieListDataSourceProtocol {
    func getSpecieList() async -> Result<SpecieResponseDTO, HTTPClientError>
}
