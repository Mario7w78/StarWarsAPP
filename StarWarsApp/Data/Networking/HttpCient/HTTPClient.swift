//
//  HTTPClient.swift
//  CoinGekoIOS
//
//  Created by Mario on 5/02/26.
//

import Foundation


protocol HTTPClient {
    func makeRequest(endpoint: EndPoint, baseURL: String) async -> Result<Data, HTTPClientError>
}
