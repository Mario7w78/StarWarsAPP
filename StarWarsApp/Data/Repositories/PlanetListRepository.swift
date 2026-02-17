//
//  FilmListRepository.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation


class PlanetListRepository: PlanetListRepositoryProtocol {
    
    private let dataSource: APIPlanetListDataSourceProtocol
    private let domainMapper: PlanetDomainMapper
    private let errorMapper: StarWarsDomainErrorMapper
    
    init(dataSource: APIPlanetListDataSourceProtocol, errorMapper: StarWarsDomainErrorMapper, domainMapper: PlanetDomainMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getPlanetList() async -> Result<[Planet], StarWarsDomainError> {
        let result = await dataSource.getPlanetList()
        
        guard case .success(let planetList) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        return .success(domainMapper.map(planetResponseDTO: planetList))
    }
}
