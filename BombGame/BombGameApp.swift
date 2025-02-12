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
//        var viewModel = CategoryViewModel()
        WindowGroup {
//            CategoryView(viewModel: viewModel)
//                .environmentObject(viewModel)
            MainView()
        }
    }
}
