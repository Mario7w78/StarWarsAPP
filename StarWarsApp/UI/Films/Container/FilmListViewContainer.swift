//
//  FilmListViewContainer.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation
import SwiftUI

struct FilmListViewContainer: View {
    
    @DependencyContainer(\.useCaseFactory) private var useCaseFactory
    
    var body: some View {
        FilmListView(
            viewModel: FilmViewModel(getFilmList: useCaseFactory.getFilmUseCase())
        )
    }
}
