//
//  APIVehicleListDataSource.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//

import Foundation


class APIVehicleListDataSource: APIVehicleListDataSourceProtocol{
    private let httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getVehicleList() async -> Result<VehicleResponseDTO, HTTPClientError> {
        let endpoint = EndPoint(path: "vehicles/", queryParameters: [:], method: HTTPMethod.get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://swapi.dev/api/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            let vehiclesListDTO = try JSONDecoder().decode(VehicleResponseDTO.self, from: data)
            return .success(vehiclesListDTO)
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
