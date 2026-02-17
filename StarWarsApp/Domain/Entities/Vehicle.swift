//
//  Vehicle.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

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
}
