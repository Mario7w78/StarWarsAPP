//
//  SearchBarView.swift
//  StarWarsApp
//
//  Created by Mario on 4/02/26.
//

import SwiftUI

struct SearchBarView: View {
    
    @StateObject var viewModel = SearchBarViewModel()
    @State var selectedFilter: String = ""
    @State var isEmpty: Bool = true
    
    var body: some View {
        ZStack {
            
            Color(.swBg).ignoresSafeArea()
            
            VStack(spacing: 15) {
                TextField("Anakin....", text: $viewModel.searchText)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(.sbBg)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 30)))
                    .onSubmit {
                        
                    }
                
                ScrollView (.horizontal){
                    HStack {
                        
                        ForEach(viewModel.FilterKeys, id: \.self){key in
                            
                            Button{
                                selectedFilter = key
                                Task {
                                    try await viewModel.searchFilterFetch(key: key)
                                    isEmpty = false
                                }
                            }label: {
                                FilterLabel(text: key, selectedFilter: selectedFilter)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                if isEmpty {

                    BlankView(imageName: "humidifier.and.droplets.fill", text: "Nothing here, Let's search!")
                        
                } else {
                    List(viewModel.filteredList){ listItem in

                        Text(listItem.title)
                            .listRowBackground(Color(.sbBg))
                        
                    }
                    .listStyle(PlainListStyle())
                }
                
            }
        }
        .foregroundStyle(.swFont)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text("Search Something")
                    .font(.title3.bold())
                    .foregroundColor(.swFont)
            }
        }
        
    }
    
}




#Preview {
    NavigationStack{
        SearchBarView()
    }
}
