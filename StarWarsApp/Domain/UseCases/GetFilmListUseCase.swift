//
//  GetFilmListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

protocol GetFilmListUseCaseProtocol {
    func execute() async -> Result<[Film], StarWarsDomainError>
}

class GetFilmListUseCase: GetFilmListUseCaseProtocol {
    private let repository: FilmListRepositoryProtocol
    
    init(repository: FilmListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Film], StarWarsDomainError> {
        
        let result = await repository.getFilmList()
        
        guard let filmList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(filmList.sorted{$0.episodeId < $1.episodeId})
    }
}
