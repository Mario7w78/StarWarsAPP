//
//  APIFilmListDataSource.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class APIPlanetListDataSource: APIPlanetListDataSourceProtocol{
    private let httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getPlanetList() async -> Result<PlanetResponseDTO, HTTPClientError> {
        let endpoint = EndPoint(path: "planets/", queryParameters: [:], method: HTTPMethod.get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://swapi.dev/api/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            let planetListDTO = try JSONDecoder().decode(PlanetResponseDTO.self, from: data)
            return .success(planetListDTO)
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




