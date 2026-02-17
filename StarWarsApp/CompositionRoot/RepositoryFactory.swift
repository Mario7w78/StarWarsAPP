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
    
}

protocol RepositoryFactoryProtocol {
    func getfilmListRepository() -> FilmListRepositoryProtocol
    func getPlanetListRepository() -> PlanetListRepositoryProtocol
    func getSpecieListRepository() -> SpecieListRepositoryProtocol
}
