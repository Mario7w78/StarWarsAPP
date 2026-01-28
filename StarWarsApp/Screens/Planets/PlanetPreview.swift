//
//  PlanetPreview.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct PlanetPreview: View {
    
    let planetName: String
    var body: some View {
        VStack {
            Image(systemName: "globe.americas.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .padding()
            Text(planetName)
                .font(.headline)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    PlanetPreview(planetName: "Planeta")
}
