//
//  SettingsView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/13/25.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - Properties
    @EnvironmentObject var coordinator: AppCoordinator
    @State var isBuzzingOn: Bool = false
    @State var isGameOn: Bool = false
    
    
    let topTitle: String = "ВРЕМЯ ИГРЫ"
    let backyardTitle: String = "Фоновая Музыка"
    var option1 = "Мелодия 1"
    private let gridColumns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack{
                Color.mainSheetBG
                BackgroundImage()
            }
            .ignoresSafeArea()
            VStack(spacing: 16) {
                
                CustomToolBar(
                    title: "Настройки",
                    leftButtonIcon: "Arrow",
                    leftButtonAction: { coordinator.pop() },
                    rightButtonIcon: "",
                    rightButtonAction: {}
                )
                
                
                SettingsSection(height: 183) {
                    Text(topTitle)
                        .font(.boldRounded(fontSize: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.bottom,13)
                    
                    LazyVGrid(columns: gridColumns, spacing: 20) {
                        ForEach(GameTime.allCases) { setting in
                            Button(action: {
                                SettingsModel.shared.gameTime = setting
                                SettingsModel.shared.printChanges()
                            }) {
                                Text(setting.rawValue)
                                    .font(.boldRounded(fontSize: 16).weight(.black))
                                    .foregroundColor(.white)
                                    .frame(width: 134 ,height: 40)
                                    .background(Color.primary.opacity(0.7))
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.bottom,10)
                .padding(.top,20)
                
                
                SettingsSection(height: 235) {
                    SettingsButton(title: backyardTitle, option: option1, action: {})
                    SettingsButton(title: "Тиканье бомбы", option: "Часы 2", action: {})
                    SettingsButton(title: "Взрыв бомбы", option: "Взрыв 1", action: {})
                }
                .padding(.bottom,10)
                
                SettingsSection(height: 151) {
                    SettingsToggleButton(title: "Вибрация", isOn: SettingsModel.$shared.switchVibrate)
                    { newState in
                        SettingsModel.shared.printChanges()
                    }
                    SettingsToggleButton(title: "Игра с заданиями", isOn: SettingsModel.$shared.switchPunishments) { newState in
                        print("Toggle switched to: \(newState)")
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    let coordinator = AppCoordinator()
    return SettingsView().environmentObject(coordinator)
}
