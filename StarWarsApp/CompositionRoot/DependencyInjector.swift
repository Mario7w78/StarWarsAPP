//
//  DependecyInyector.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

final class DependencyInjector: ObservableObject {
    private let htttpClient : HTTPClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
    
    lazy var remoteDSFactory : RemoteDSFactoryProtocol = RemoteDSFactory(httpClient: htttpClient)
    lazy var repositoryFactory : RepositoryFactoryProtocol = RepositoryFactory(remoteDSFactory: remoteDSFactory)
    lazy var useCaseFactory : UseCaseFactoryProtocol = UseCaseFactory(repositoryFactory: repositoryFactory)
}
