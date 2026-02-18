//
//  APIFilmListDataSource.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class APISpecieListDataSource: APISpecieListDataSourceProtocol{
    private let httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getSpecieList() async -> Result<SpecieResponseDTO, HTTPClientError> {
        let endpoint = EndPoint(path: "species/", queryParameters: [:], method: HTTPMethod.get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://swapi.dev/api/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            let speciesListDTO = try JSONDecoder().decode(SpecieResponseDTO.self, from: data)
            return .success(speciesListDTO)
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



