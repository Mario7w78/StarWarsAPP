//
//  APIPlanetListDataSourceProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//


protocol APIPlanetListDataSourceProtocol {
    func getPlanetList() async -> Result<PlanetResponseDTO, HTTPClientError>
}
