//
//  URLSessionRequestMaker.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation


class URLSessionRequestMaker {
    func url (endpoint: EndPoint, baseURL: String) -> URL?{
        var urlComponents = URLComponents(string: baseURL + endpoint.path)
        
        let urlQueryParameters = endpoint.queryParameters.map{ URLQueryItem(name: $0.key, value: "\($0.value)")}
        urlComponents?.queryItems = urlQueryParameters

        return urlComponents?.url
    }
}
