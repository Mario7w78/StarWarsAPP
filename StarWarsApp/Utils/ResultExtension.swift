//
//  ResultExtension.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation
extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
