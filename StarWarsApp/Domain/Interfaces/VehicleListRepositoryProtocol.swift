//
//  VehicleListRepositoryProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol VehicleListRepositoryProtocol {
    func getVehicleList() async -> Result<[Vehicle], StarWarsDomainError>
}