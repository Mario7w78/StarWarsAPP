//
//  StarWarsPresentableErrorMapper.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

class StarWarsPresentableErrorMapper {
    
    func mapError(_ error:StarWarsDomainError) -> String {
        switch error {
        case .badRequest:
            return "Bad Request"
        case .notFound:
            return "Not Found"
        case .tooManyRequests:
            return "Too Many Requests"
        case .generic:
            return "I dont know Error"
        }
    }
}
