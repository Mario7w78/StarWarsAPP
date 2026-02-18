//
//  Character.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

struct Character: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let url: String
}
