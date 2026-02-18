//
//  SpecieGridView.swift
//  StarWarsApp
//
//  Created by Mario on 28/01/26.
//

import SwiftUI

struct SpecieGridView: View {
    @ObservedObject private var viewModel: SpecieViewModel
    private let film: [String]
    init(viewModel: SpecieViewModel, film: [String]) {
        self.viewModel = viewModel
        self.film = film
    }
    
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
                await viewModel.getSpecies(filmSpecieUrl: film)
            }
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

//#Preview {
//    SpecieGridView(film: ["https://swapi.dev/api/species/1/"])
//}
