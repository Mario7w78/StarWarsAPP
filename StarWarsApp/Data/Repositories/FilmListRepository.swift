//
//  FilmListRepository.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation


final class FilmListRepository: FilmListRepositoryProtocol {
    private let dataSource: APIFilmListDataSourceProtocol
    private let domainMapper: FilmDomainMapper
    private let errorMapper: StarWarsDomainErrorMapper
    
    init(dataSource: APIFilmListDataSourceProtocol, errorMapper: StarWarsDomainErrorMapper, domainMapper: FilmDomainMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getFilmList() async -> Result<[Film], StarWarsDomainError> {
        let result = await dataSource.getFilmList()
        
        guard case .success(let filmList) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        return .success(domainMapper.map(filmResponseDTO: filmList))
    }
}
