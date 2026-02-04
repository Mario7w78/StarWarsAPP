//
//  BlankView.swift
//  StarWarsApp
//
//  Created by Mario on 4/02/26.
//

import SwiftUI

struct BlankView: View {
    let imageName: String
    let text: String
    var body: some View {
        
        VStack{
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
                
         
            Text(text)
                .font(.headline.bold())
        }
        .foregroundStyle(.gray.opacity(0.6))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    BlankView(imageName: "eject.circle", text: "Nothing Here..., let's search!")
}
