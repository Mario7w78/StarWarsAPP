//
//  RemoteDSFactoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol RemoteDSFactoryProtocol {
    func getFilmListDataSource() -> APIFilmListDataSourceProtocol
    func getPlanetListDataSource() -> APIPlanetListDataSourceProtocol
    func getSpecieListDataSource() -> APISpecieListDataSourceProtocol
    func getCharacterListDataSource() -> APICharacterListDataSourceProtocol
    func getVehicleListDataSource() -> APIVehicleListDataSourceProtocol
}
