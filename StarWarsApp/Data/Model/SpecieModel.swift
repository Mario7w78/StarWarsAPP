//
//  SpeciesModel.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import Foundation

struct SpecieResponse: Decodable {
    let results: [Specie]
}


struct Specie: Decodable {
    
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let language: String
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case classification = "classification"
        case designation = "designation"
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case language = "language"
        case people = "people"
    }
}


