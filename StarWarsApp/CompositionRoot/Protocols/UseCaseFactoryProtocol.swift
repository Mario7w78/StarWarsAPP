//
//  UseCaseFactoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol UseCaseFactoryProtocol {
    func getFilmUseCase() -> GetFilmListUseCaseProtocol
    func getPlanetUseCase() -> GetPlanetListUseCaseProtocol
    func getPlanetByFilmUseCase() -> GetPlanetListByFilmUseCaseProtocol
    func getSpecieUseCase() -> GetSpecieListUseCaseProtocol
    func getSpeciesByFilmUseCase() -> GetSpecieListByFilmUseCaseProtocol
    func getCharacterUseCase() -> GetCharacterListUseCaseProtocol
    func getCharactersBySpeciesUseCase() -> GetCharactersBySpecieUseCaseProtocol
    func getvehicleUseCase() -> GetVehicleListUseCaseProtocol
    func getVehiclesByFilmUseCase() -> GetVehicleByFilmUseCaseProtocol
}
