//
//  SpecieListViewContainer.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//

import Foundation
import SwiftUI

struct SpecieListViewContainer: View {
    
    @DependencyContainer(\.useCaseFactory) private var useCaseFactory
    let film: [String]
    var body: some View {
        SpecieGridView(
            viewModel: SpecieViewModel(getSpecieList: useCaseFactory.getSpeciesByFilmUseCase()), film: film
        )
    }
}

