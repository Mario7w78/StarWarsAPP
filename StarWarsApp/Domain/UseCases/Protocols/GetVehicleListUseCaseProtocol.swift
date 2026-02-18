//
//  GetSpecieListUseCaseProtocol 2.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol GetVehicleListUseCaseProtocol {
    func execute() async -> Result<[Vehicle], StarWarsDomainError>
}
