//
//  BombGameApp.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 10.02.2025.
//

import SwiftUI

@main
struct BombGameApp: App {
    @StateObject  private var appCoordinator = AppCoordinator()
    @StateObject private var categoryViewModel = CategoryViewModel()
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(appCoordinator)
                .environmentObject(categoryViewModel)
        }
    }
}
