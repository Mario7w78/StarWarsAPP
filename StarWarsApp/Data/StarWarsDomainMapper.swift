//
//  StarWarsDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

class StarWarsDomainErrorMapper{
    func map(error: HTTPClientError?) -> StarWarsDomainError{
        guard error == .tooManyRequests else {
            return .generic
        }
        return .generic
    }
}
