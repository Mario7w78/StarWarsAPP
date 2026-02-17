//
//  GetPlanetsByFilmUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

class GetPlanetsByFilmUseCase: GetPlanetListByFilmUseCaseProtocol {

    private let repository: PlanetListRepositoryProtocol
    
    init(repository: PlanetListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute( filmPlanetUrl: [String] ) async -> Result<[Planet], StarWarsDomainError>{
        let result = await repository.getPlanetList()
        
        guard let planetList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        let planetsByFilm = planetList.filter{ filmPlanetUrl.contains($0.url)}
        
        return .success(planetsByFilm)
    }
}
