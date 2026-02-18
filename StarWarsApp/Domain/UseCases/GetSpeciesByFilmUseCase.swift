//
//  GetSpeciesByFilmUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class GetSpeciesByFilmUseCase: GetSpecieListByFilmUseCaseProtocol {

    private let repository: SpecieListRepositoryProtocol
    
    init(repository: SpecieListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute( filmSpecieUrl: [String] ) async -> Result<[Specie], StarWarsDomainError>{
        let result = await repository.getSpecieList()
        
        guard let specieList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        
        let speciesByFilm = specieList.filter{ filmSpecieUrl.contains($0.url)}
        
        return .success(speciesByFilm)
    }
}