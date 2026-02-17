//
//  GetPlanetListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

class GetPlanetListUseCase: GetPlanetListUseCaseProtocol {
    private let repository: PlanetListRepositoryProtocol
    
    init(repository: PlanetListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Planet], StarWarsDomainError> {
        
        let result = await repository.getPlanetList()
        
        guard let planetList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(planetList)
    }
}

