//
//  File.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

protocol SpecieListRepositoryProtocol {
    func getSpecieList() async -> Result<[Specie], StarWarsDomainError>
}
