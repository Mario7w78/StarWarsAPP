//
//  APICharacterListDataSource.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//

import Foundation

class APICharacterListDataSource: APICharacterListDataSourceProtocol{
    private let httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async -> Result<CharacterResponseDTO, HTTPClientError> {
        
        var characterList: [CharacterResponseDTO.Character] = []
        
        for page in 1...5 {
            let endpoint = EndPoint(path: "people/", queryParameters: ["page": page], method: HTTPMethod.get)
            
            let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: "https://swapi.dev/api/") 
            
            guard case .success(let data) = result else {
                print ("Error: \(String(describing: result.failureValue))")
                return .failure(handleError(error: result.failureValue as? HTTPClientError))
            }
            
            do {
                let characterListDTOPage = try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
                            
                characterListDTOPage.results.forEach{
                    characterList.append($0)
                }
            }
            catch {
                return .failure(.parsingError)
            }
        }
        
        return .success(CharacterResponseDTO(results: characterList))
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError{
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
