//
//  RepositoryFactory.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation


final class RepositoryFactory: RepositoryFactoryProtocol {
    private let remoteDSFactory: RemoteDSFactoryProtocol
    
    init(
        remoteDSFactory: RemoteDSFactoryProtocol
    ) {
        self.remoteDSFactory = remoteDSFactory
    }
    
    //MARK: FilmRepository
    
    private lazy var filmListRepository: FilmListRepositoryProtocol = {
        FilmListRepository(
            dataSource: remoteDSFactory.getFilmListDataSource(),
            errorMapper: StarWarsDomainErrorMapper(),
            domainMapper: FilmDomainMapper()
        )
    }()
    
    func getfilmListRepository() -> FilmListRepositoryProtocol {
        filmListRepository
    }
    
    //MARK: PlanetRepository
    
    private lazy var planetListRepository: PlanetListRepositoryProtocol = {
        PlanetListRepository(
            dataSource: remoteDSFactory.getPlanetListDataSource(),
            errorMapper: StarWarsDomainErrorMapper(),
            domainMapper: PlanetDomainMapper()
        )
    }()
    
    func getPlanetListRepository() -> PlanetListRepositoryProtocol {
        planetListRepository
    }
    
    //MARK: SpecieRepository
    
    private lazy var specieListRepository: SpecieListRepositoryProtocol = {
        SpecieListRepository(
            dataSource: remoteDSFactory.getSpecieListDataSource(),
            errorMapper: StarWarsDomainErrorMapper(),
            domainMapper: SpecieDomainMapper()
        )
    }()
    
    func getSpecieListRepository() -> SpecieListRepositoryProtocol {
        specieListRepository
    }
    
    //MARK: SpecieRepository
    
    private lazy var characterListRepository: CharacterListRepositoryProtocol = {
        CharacterListRepository(
            dataSource: remoteDSFactory.getCharacterListDataSource(),
            errorMapper: StarWarsDomainErrorMapper(),
            domainMapper: CharacterDomainMapper()
        )
    }()
    
    func getCharacterListRepository() -> CharacterListRepositoryProtocol {
        characterListRepository
    }
    
    //MARK: VehicleRepository
    
    private lazy var vehicleListRepository: VehicleListRepositoryProtocol = {
        VehicleListRepository(
            dataSource: remoteDSFactory.getVehicleListDataSource(),
            errorMapper: StarWarsDomainErrorMapper(),
            domainMapper: VehicleDomainMapper()
        )
    }()
    
    func getVehicleListRepository() -> VehicleListRepositoryProtocol {
        vehicleListRepository
    }
    
}

