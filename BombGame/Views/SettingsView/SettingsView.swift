//
//  SettingsView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/13/25.
//


import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ZStack(alignment: .center){
            ZStack {
                Color.mainSheetBG
                BackgroundImage()
            }
            .ignoresSafeArea()

            VStack{
                
                CustomToolBar(title: "Настройки", leftButtonIcon: "Arrow", leftButtonAction:{ coordinator.pop()}, rightButtonIcon: "", rightButtonAction: {})
                Spacer()
            }
            Spacer()
        }
    }
}


#Preview{
    let coordinator = AppCoordinator()
    SettingsView()
        .environmentObject(coordinator)
}
