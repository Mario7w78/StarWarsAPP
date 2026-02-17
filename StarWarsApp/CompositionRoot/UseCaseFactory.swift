//
//  UseCaseFactory.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation


final class UseCaseFactory: UseCaseFactoryProtocol{
    
    private let repositoryFactory: RepositoryFactoryProtocol
    
    init(repositoryFactory: RepositoryFactoryProtocol) {
        self.repositoryFactory = repositoryFactory
    }
    
    //MARK: FilmUseCase
    
    private lazy var filmUseCase: GetFilmListUseCaseProtocol = {
        GetFilmListUseCase(repository: repositoryFactory.getfilmListRepository())
    }()
    
    func getFilmUseCase() -> GetFilmListUseCaseProtocol { filmUseCase }
    
    //MARK: PlanetUseCase
    
    private lazy var planetUseCase: GetPlanetListUseCaseProtocol = {
        GetPlanetListUseCase(repository: repositoryFactory.getPlanetListRepository())
    }()
    
    func getPlanetUseCase() -> GetPlanetListUseCaseProtocol { planetUseCase }
    
    private lazy var planetByFilmUseCase: GetPlanetListByFilmUseCaseProtocol = {
        GetPlanetsByFilmUseCase(repository: repositoryFactory.getPlanetListRepository())
    }()

    func getPlanetByFilmUseCase() -> GetPlanetListByFilmUseCaseProtocol { planetByFilmUseCase }
    
    //MARK: SpecieUseCase
    
    private lazy var specieUseCase: GetSpecieListUseCaseProtocol = {
        GetSpecieListUseCase(repository: repositoryFactory.getSpecieListRepository())
    }()
    
    func getSpecieUseCase() -> GetSpecieListUseCaseProtocol { specieUseCase }
    
    
}

protocol UseCaseFactoryProtocol {
    func getFilmUseCase() -> GetFilmListUseCaseProtocol
    func getPlanetUseCase() -> GetPlanetListUseCaseProtocol
    func getPlanetByFilmUseCase() -> GetPlanetListByFilmUseCaseProtocol
    func getSpecieUseCase() -> GetSpecieListUseCaseProtocol
}
