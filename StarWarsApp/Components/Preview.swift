//
//  Preview.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import SwiftUI

struct Preview: View {
    
    let text: String
    let imageName: String
    var body: some View {
        VStack() {
            Image(systemName: imageName)
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .padding()
            Text(text)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .padding(.bottom, 10)
    }
    
}

#Preview {
    Preview(text: "Preview", imageName: "globe.americas.fill")
}
