//
//  PlanetListRepositoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

protocol PlanetListRepositoryProtocol {
    func getPlanetList() async -> Result<[Planet], StarWarsDomainError>
}
