//
//  APIFilmListDataSource.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class APIFilmListDataSource: APIFilmListDataSourceProtocol{
    private let httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getFilmList() async -> Result<FilmResponseDTO, HTTPClientError> {
        let endpoint = EndPoint(path: "films/", queryParameters: [:], method: HTTPMethod.get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://swapi.dev/api/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            let filmListDTO = try JSONDecoder().decode(FilmResponseDTO.self, from: data)
            return .success(filmListDTO)
        }
        catch {
            return .failure(.parsingError)
        }
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError{
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
