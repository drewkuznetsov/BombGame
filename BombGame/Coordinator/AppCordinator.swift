//
//  AppCordinator.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/13/25.
//

import Foundation
import SwiftUI
//MARK: - Screens
enum Screen: Identifiable, Hashable {
    case mainView
    case categoryView
    case gameView(selectedCategory: Category)
    case settingsView
    case finalGameView
    
    var id: Self { return self }
}
//MARK: - Protocol Stack
protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
   
    func push(_ screen: Screen)
    func pop()
    func popToRoot()
}
//MARK: - Coordinator
class AppCoordinator: AppCoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .mainView:
            MainView()
                .navigationBarBackButtonHidden(true)
        case .categoryView:
            CategoryView(parsingService: ParsingService())
                .navigationBarBackButtonHidden(true)
        case .gameView(let selectedCategory):
            GameView(parsingService: ParsingService(), selectedCategory: selectedCategory)
                .navigationBarBackButtonHidden(true)
        case .settingsView:
            SettingsView()
                .navigationBarBackButtonHidden(true)
        case .finalGameView:
            FinalGameView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
