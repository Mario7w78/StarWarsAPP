//
//  FilmListRepository.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation


class SpecieListRepository: SpecieListRepositoryProtocol {
   
    private let dataSource: APISpecieListDataSourceProtocol
    private let domainMapper: SpecieDomainMapper
    private let errorMapper: StarWarsDomainErrorMapper
    
    init(dataSource: APISpecieListDataSourceProtocol, errorMapper: StarWarsDomainErrorMapper, domainMapper: SpecieDomainMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getSpecieList() async -> Result<[Specie], StarWarsDomainError> {
        let result = await dataSource.getSpecieList()
        
        guard case .success(let specieList) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        return .success(domainMapper.map(specieResponseDTO: specieList))
    }
}




