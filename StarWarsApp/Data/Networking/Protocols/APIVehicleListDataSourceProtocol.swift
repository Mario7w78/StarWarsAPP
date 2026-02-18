//
//  APIVehicleListDataSourceProtocol.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


protocol APIVehicleListDataSourceProtocol {
    func getVehicleList() async -> Result<VehicleResponseDTO, HTTPClientError>
}