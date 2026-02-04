//
//  VehiclesModel.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import Foundation

struct VehicleResponse: Decodable{
    let results: [Vehicle]
}

struct Vehicle: Decodable{
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let vehicleClass: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case manufacturer = "manufacturer"
        case costInCredits = "cost_in_credits"
        case length = "length"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew = "crew"
        case consumables = "consumables"
        case vehicleClass = "vehicle_class"
        case passengers = "passengers"
        case cargoCapacity = "cargo_capacity"
    }
    
}



