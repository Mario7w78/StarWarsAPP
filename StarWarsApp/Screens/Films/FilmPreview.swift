//
//  FilmPreview.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

struct FilmPreview: View {
    let title: String
    let episode: Int
    var body: some View {
        VStack{
            Image("filmImage")
                .resizable()
                .scaledToFit()
            Text(title)
                .foregroundStyle(.white)
                .bold()
            Text("Episode \(episode.description)")
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
    }
}

#Preview {
    FilmPreview(title: "Titulo", episode: 1)
}
