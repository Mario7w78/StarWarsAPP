//
//  GetFilmListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class GetSpecieListUseCase: GetSpecieListUseCaseProtocol {
    private let repository: SpecieListRepositoryProtocol
    
    init(repository: SpecieListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Specie], StarWarsDomainError> {
        
        let result = await repository.getSpecieList()
        
        guard let specieList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(specieList)
    }
}
