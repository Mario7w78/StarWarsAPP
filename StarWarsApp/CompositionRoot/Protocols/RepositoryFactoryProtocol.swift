//
//  RepositoryFactoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol RepositoryFactoryProtocol {
    func getfilmListRepository() -> FilmListRepositoryProtocol
    func getPlanetListRepository() -> PlanetListRepositoryProtocol
    func getSpecieListRepository() -> SpecieListRepositoryProtocol
    func getCharacterListRepository() -> CharacterListRepositoryProtocol
    func getVehicleListRepository() -> VehicleListRepositoryProtocol
}
