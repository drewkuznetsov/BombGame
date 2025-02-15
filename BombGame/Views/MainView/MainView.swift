//
//  MainView.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - PRIVATE PROPERTIES
    @State private var isPresented = false
    //    @StateObject private var viewModel = PunishmentsViewModel()
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @EnvironmentObject var audioManager: AudioManager
    
    
    //MARK: - UI
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.mainBackground
                
                BackgroundImage()
                
            }
            .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                CustomToolBar(title: "", leftButtonIcon: "gearWheel", leftButtonAction: {
                    appCoordinator.push(.settingsView)
                }, rightButtonIcon: "QuestionRed") {
                    isPresented.toggle()
                }
                
                VStack {
                    Text("ИГРА ДЛЯ КОМПАНИИ")
                        .font(.boldRounded(fontSize: 28))
                        .shadow(radius: 8)
                    
                    Text("БОМБА")
                        .font(.boldRounded(fontSize: 48))
                        .shadow(radius: 8)
                }
                
                Spacer()
                
                Image("mainBombImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.75)
                
                Spacer()
                
                CustomButton(title: "Старт игры", backgroundColor: .mainViewButton) {
                    //todo link to gameView
                    if categoryViewModel.selectedCategories.isEmpty {
                        print("No category selected!")
                    } else {
                        let selectedCategory = categoryViewModel.selectedCategories.first!
                        appCoordinator.push(.gameView(selectedCategory: selectedCategory))
                    }                    }
                
                CustomButton(title: "Категории", backgroundColor: .mainViewButton) {
                    //todo link to categoryView
                    appCoordinator.push(.categoryView)
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            RulesView()
                .presentationDetents([.fraction(0.754)])
                .presentationDragIndicator(.visible)
                .ignoresSafeArea(edges: .bottom)
        }
        .onAppear() {
            audioManager.playBackgroundMusic()
        }
    }
}

//MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let appCoordinator = AppCoordinator()
        let categoryViewModel = CategoryViewModel()
        MainView()
            .environmentObject(appCoordinator)
            .environmentObject(categoryViewModel)
    }
}
//#Preview {
//    MainView()
//}
