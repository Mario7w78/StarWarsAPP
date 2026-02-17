//
//  PlanetListViewContainer.swift
//  StarWarsApp
//
//  Created by Mario on 17/02/26.
//

import Foundation

import SwiftUI

struct PlanetListViewContainer: View {
    
    @DependencyContainer(\.useCaseFactory) private var useCaseFactory
    
    var body: some View {
        PlanetListView(
            viewModel: PlanetViewModel(getPlanetList: useCaseFactory.getPlanetUseCase())
        )
    }
}

// Sapo: Cosas que hacer -> Demas entidades -> Containers
