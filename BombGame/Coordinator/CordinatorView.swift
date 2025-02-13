//
//  CordinatorView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/13/25.
//


import Foundation
import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator 
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.mainView)
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
        }
        .environmentObject(appCoordinator)
    }
}
