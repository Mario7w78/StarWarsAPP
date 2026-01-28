//
//  LabelButton.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct LabelButton: View {
    let title: String
    let imageName: String
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(height: 50)
            Text(title)
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    LabelButton(title: "Planets", imageName: "globe.americas.fill")
}
