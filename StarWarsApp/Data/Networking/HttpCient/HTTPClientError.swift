//
//  Networking.swift
//  CoinGekoIOS
//
//  Created by Mario on 4/02/26.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case invalidURL
    case generic
    case responseError
    case tooManyRequests
}
