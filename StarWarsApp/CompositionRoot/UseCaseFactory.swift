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
    
    private lazy var speciesByFilmUseCase: GetSpecieListByFilmUseCaseProtocol = {
        GetSpeciesByFilmUseCase(repository: repositoryFactory.getSpecieListRepository())
    }()
    
    func getSpeciesByFilmUseCase() -> GetSpecieListByFilmUseCaseProtocol {
        speciesByFilmUseCase
    }
    
    //MARK: CharacterUseCase
    
    private lazy var characterUseCase: GetCharacterListUseCaseProtocol = {
        GetCharacterListUseCase(repository: repositoryFactory.getCharacterListRepository())
    }()
    
    func getCharacterUseCase() -> GetCharacterListUseCaseProtocol { characterUseCase }
    
    private lazy var charactersBySpecieUseCase: GetCharactersBySpecieUseCaseProtocol = {
        GetCharactersBySpecieUseCase(repository: repositoryFactory.getCharacterListRepository())
    }()
    
    func getCharactersBySpeciesUseCase() -> GetCharactersBySpecieUseCaseProtocol {
        charactersBySpecieUseCase
    }
    
    //MARK: VehicleUseCase
    
    private lazy var vehicleUseCase: GetVehicleListUseCaseProtocol = {
        GetVehicleListUseCase(repository: repositoryFactory.getVehicleListRepository())
    }()
    
    func getvehicleUseCase() -> GetVehicleListUseCaseProtocol { vehicleUseCase }
    
    private lazy var vehicleByFilmListUseCase: GetVehicleByFilmUseCaseProtocol = {
        GetVehicleByFilmListUseCase(repository: repositoryFactory.getVehicleListRepository())
    }()
    
    func getVehiclesByFilmUseCase() -> GetVehicleByFilmUseCaseProtocol {
        vehicleByFilmListUseCase
    }
}

