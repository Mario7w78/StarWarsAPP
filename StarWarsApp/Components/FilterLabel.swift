//
//  FilterButton.swift
//  StarWarsApp
//
//  Created by Mario on 4/02/26.
//

import SwiftUI

struct FilterLabel: View {
    
    let text: String
    
    let selectedFilter: String
    
    var isSelected: Bool {
        selectedFilter == text
    }
    
    var body: some View {
        Text(text)
            .font(isSelected ? .subheadline.bold() : .subheadline)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(isSelected ? Color.swFont : Color.sbBg)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 30)))
            .foregroundStyle(isSelected ? Color.swBg : Color.swFont)
    }
}

#Preview {
    FilterLabel(text: "Characters", selectedFilter: "Characters")
}
