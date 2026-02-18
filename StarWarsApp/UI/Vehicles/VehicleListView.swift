//
//  VehicleListView.swift
//  StarWarsApp
//
//  Created by Mario on 28/01/26.
//

import SwiftUI

struct VehicleListView: View {
    @ObservedObject private var viewModel: VehicleViewModel
    let film: [String]
    init(viewModel: VehicleViewModel, film: [String]) {
        self.viewModel = viewModel
        self.film = film
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.swBg).edgesIgnoringSafeArea(.all)
                
                VStack{
                    List(viewModel.vehicles, id: \.name){vehicle in
                        HStack() {
                            Image(systemName: "triangle.fill")
                            Text(vehicle.name)
                        }
                        .listRowBackground(Color(.swBg))
                    }
                    .foregroundStyle(.white)
                    .listStyle(.plain)
                }
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.white)
                }
            }
            .task{await viewModel.getVehicles(filmVehicleUrl: film)}
            .toolbar {
                ToolbarItem(placement: .principal) {
                            Text("Vehicles")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                        }
                    }
        }
        
        
    }
}

//#Preview {
//    VehicleListView(film: ["https://swapi.dev/api/vehicles/8/"])
//}
