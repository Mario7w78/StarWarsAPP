//
//  StarWarsApp.swift
//  StarWarsApp
//
//  Created by Mario on 27/01/26.
//

import SwiftUI

@main
struct StarWarsApp: App {
    @StateObject private var di = DependencyInjector()
    var body: some Scene {
        WindowGroup {
            MenuStarWars()
                .environmentObject(di)
        }
    }
}
