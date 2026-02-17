//
//  APIFilmListProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

protocol APIFilmListDataSourceProtocol {
    func getFilmList() async -> Result <FilmResponseDTO, HTTPClientError>
}
