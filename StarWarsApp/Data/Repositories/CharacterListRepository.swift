//
//  CharacterListRepository.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class CharacterListRepository: CharacterListRepositoryProtocol {
   
    private let dataSource: APICharacterListDataSourceProtocol
    private let domainMapper: CharacterDomainMapper
    private let errorMapper: StarWarsDomainErrorMapper
    
    init(dataSource: APICharacterListDataSourceProtocol, errorMapper: StarWarsDomainErrorMapper, domainMapper: CharacterDomainMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getCharacterList() async -> Result<[Character], StarWarsDomainError> {
        let result = await dataSource.getCharacterList()
        
        guard case .success(let characterList) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        return .success(domainMapper.map(characterResponseDTO: characterList))
    }
}


