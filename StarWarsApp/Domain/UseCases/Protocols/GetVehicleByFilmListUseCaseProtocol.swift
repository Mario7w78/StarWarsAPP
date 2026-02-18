//
//  GetVehicleByFilmListUseCaseProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol GetVehicleByFilmUseCaseProtocol {
    func execute(filmVehicleUrl: [String]) async -> Result<[Vehicle], StarWarsDomainError>
}
