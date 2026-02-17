//
//  File.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

protocol FilmListRepositoryProtocol {
    func getFilmList() async -> Result<[Film], StarWarsDomainError>
}
