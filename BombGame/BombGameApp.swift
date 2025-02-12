//
//  BombGameApp.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 10.02.2025.
//

import SwiftUI

@main
struct BombGameApp: App {
    var body: some Scene {
        let viewModel = CategoryViewModel(fileName: "questions")
        WindowGroup {
            CategoryView(viewModel: viewModel)
                .environmentObject(viewModel)
        }
    }
}
