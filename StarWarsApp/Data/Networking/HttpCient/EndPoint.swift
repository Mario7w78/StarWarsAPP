//
//  EndPoint.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

struct EndPoint {
    let path: String
    let queryParameters: [String: Any]
    let method: HTTPMethod
    let baseURL: String = ""
}
