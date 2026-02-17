//
//  Specie.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

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
}
