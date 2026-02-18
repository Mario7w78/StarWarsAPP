//
//  RemoteDSFactory.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

final class RemoteDSFactory: RemoteDSFactoryProtocol{
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    //MARK: FilmDataSource
    
    private lazy var filmListDataSource: APIFilmListDataSourceProtocol = {
        APIFilmListDataSource(httpClient: httpClient)
    }()
    
    func getFilmListDataSource() -> APIFilmListDataSourceProtocol {
        filmListDataSource
    }
    
    //MARK: PlanetDataSource
    
    private lazy var planetListDataSource: APIPlanetListDataSourceProtocol = {
        APIPlanetListDataSource(httpClient: httpClient)
    }()
    
    func getPlanetListDataSource() -> APIPlanetListDataSourceProtocol {
        planetListDataSource
    }
    
    //MARK: SpecieDataSource
    
    private lazy var specieListDataSource: APISpecieListDataSourceProtocol = {
        APISpecieListDataSource(httpClient: httpClient)
    }()
    
    func getSpecieListDataSource() -> APISpecieListDataSourceProtocol {
        specieListDataSource
    }
    
    //MARK: CharacterDataSource
    
    private lazy var characterListDataSource: APICharacterListDataSourceProtocol = {
        APICharacterListDataSource(httpClient: httpClient)
    }()
    
    func getCharacterListDataSource() -> APICharacterListDataSourceProtocol {
        characterListDataSource
    }
    
    //MARK: VehiclesDataSource
    
    private lazy var vehicleListDataSource: APIVehicleListDataSourceProtocol = {
        APIVehicleListDataSource(httpClient: httpClient)
    }()
    
    func getVehicleListDataSource() -> APIVehicleListDataSourceProtocol {
        vehicleListDataSource
    }
    
    
}



