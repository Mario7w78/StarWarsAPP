//
//  GetCharacterListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class GetCharacterListUseCase: GetCharacterListUseCaseProtocol {
    private let repository: CharacterListRepositoryProtocol
    
    init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Character], StarWarsDomainError> {
        
        let result = await repository.getCharacterList()
        
        guard let characterList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(characterList)
    }
}

