//
//  FilmFactory.swift
//  StarWarsApp
//
//  Created by Mario on 16/02/26.
//

import Foundation

@MainActor
class FilmFactory {
    static func create() -> FilmListView {
        return FilmListView(viewModel: createViewModel())
    }
    
    static private func createViewModel() -> FilmViewModel {
        return FilmViewModel(getFilmList: createUseCase())
    }
    
    static private func createUseCase() -> GetFilmListUseCase {
        return GetFilmListUseCase(repository: createRepository())
    }
    
    static private func createRepository() -> FilmListRepositoryProtocol {
        return FilmListRepository(dataSource: createDataSource(), errorMapper: StarWarsDomainErrorMapper(), domainMapper: FilmDomainMapper())
    }
    
    static private func createDataSource() -> APIFilmListDataSourceProtocol {
        return APIFilmListDataSource(httpClient: createHTTPCliente())
    }
    
    static private func createHTTPCliente() -> HTTPClient {
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
    }
    
}
