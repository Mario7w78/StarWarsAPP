//
//  VehicleListView.swift
//  StarWarsApp
//
//  Created by Mario on 28/01/26.
//

import SwiftUI

struct VehicleListView: View {
    @StateObject var viewModel = VehicleViewModel()
    let film: [String]
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
            .task{await viewModel.getVehicles(film: film)}
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

#Preview {
    VehicleListView(film: ["https://swapi.dev/api/vehicles/8/"])
}
