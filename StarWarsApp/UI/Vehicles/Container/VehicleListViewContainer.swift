//
//  VehicleListViewContainer.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//

import Foundation
import SwiftUI

struct VehicleListViewContainer: View {
    
    @DependencyContainer(\.useCaseFactory) private var useCaseFactory
    let film: [String]
    var body: some View {
        VehicleListView(
            viewModel: VehicleViewModel(getVehicleList: useCaseFactory.getVehiclesByFilmUseCase()), film: film)
    }
}
