//
//  SpeciePreview.swift
//  StarWarsApp
//
//  Created by Mario on 28/01/26.
//

import SwiftUI

struct SpeciePreview: View {
    let specieName: String
    var body: some View {
        VStack{
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundStyle(.white)
            
            Text(specieName)
                .foregroundStyle(.white)
                .bold()
            
        }
        .padding()
    }
}

#Preview {
    SpeciePreview(specieName: "Sapo")
}
