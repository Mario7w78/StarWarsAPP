//
//  Planet.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let url: String
}
