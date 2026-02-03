//
//  SpacedRow.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import SwiftUI

struct SpacedRow: View {
    let title: String
    let value: String
    let imageName: String
    var body: some View {
        
        HStack{
            Label(title, systemImage: imageName)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 20)
        .frame(height: 50)
        .background(Color.gray.opacity(0.4))
        .fontWeight(.bold)
        .padding(.vertical, 2)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SpacedRow(title: "Average Height", value: "180", imageName: "star")
}
