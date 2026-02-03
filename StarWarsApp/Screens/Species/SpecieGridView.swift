//
//  SpecieGridView.swift
//  StarWarsApp
//
//  Created by Mario on 28/01/26.
//

import SwiftUI

struct SpecieGridView: View {
    @StateObject var viewModel = SpecieViewModel()
    let film: [String]
    var body: some View {
        NavigationStack{
            ZStack{
                Color.swBg.edgesIgnoringSafeArea(.all)
                ScrollView{
                    LazyVGrid(columns: viewModel.columns){
                        ForEach(viewModel.species, id: \.name) { specie in
                            NavigationLink(destination: SpecieDetailView(specie: specie)){
                                SpeciePreview(specieName: specie.name)
                            }
                        }
                    }
                    
                }
                if viewModel.isLoading{
                    ProgressView()
                        .tint(.white)
                }
            }
            .task {
                do
                {
                    try await viewModel.getSpecies(film: film)}
                catch {
                    print(viewModel.errorMessage!)}}
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Species")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    SpecieGridView(film: ["https://swapi.dev/api/species/1/"])
}
