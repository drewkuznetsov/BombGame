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
    @AppStorage("isFeatureEnabled") private var isFeatureEnabled = false
    
    
    @State private var isExpandedMelodi = false
    @State private var isExpandedTimerSound = false
    @State private var isExpandedBangSound = false
    
    
    @State var selectedMelodi = SettingsModel.shared.melodiName
    @State var selectedTimerSound = SettingsModel.shared.timerSound
    @State var selectedBangSound = SettingsModel.shared.bangSound
    
    @State var selectedTime = SettingsModel.shared.gameTime
    
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
                
                ScrollView {
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
                                selectedTime = setting
                                SettingsModel.shared.printChanges()
                            }) {
                                Text(setting.rawValue)
                                    .font(.boldRounded(fontSize: 16).weight(.black))
                                    .foregroundColor(.white)
                                    .frame(width: 134 ,height: 40)
                                    .background(Color.primary.opacity(0.7))
                                    .cornerRadius(15)
                            }
                            .opacity(setting == selectedTime ? 0.5 : 1)
                        }
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.bottom,22)
                .padding(.top,20)
                    SettingsSection(height: isExpandedMelodi || isExpandedTimerSound || isExpandedBangSound ? 340 : 235) {
                    ScrollView(){
                        VStack(spacing: 22){
                            CustomToggleButton(
                                selectedValue: SettingsModel.$shared.melodiName, //$selectedMelodi,
                                isExpanded: $isExpandedMelodi,
                                title: "Фоновая музыка"
                            )
                            
                            
                            CustomToggleButton(
                                selectedValue: $selectedTimerSound,
                                isExpanded: $isExpandedTimerSound,
                                title: "Тиканье бомбы"
                            )
                            
                            CustomToggleButton(
                                selectedValue: $selectedBangSound,
                                isExpanded: $isExpandedBangSound,
                                title: "Взрыв бомбы"
                            )
                            
                        }
                        
                        .padding()
                    }
            }
                    .padding(.bottom,22)

                    
                    
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
                .onDisappear(){
                    
//                    SettingsModel.shared.melodiName = selectedMelodi
                    SettingsModel.shared.bangSound = selectedBangSound
                    SettingsModel.shared.timerSound = selectedTimerSound
                    SettingsModel.shared.printChanges()
                    }
                }
            }
        
    }
}

#Preview {
    let coordinator = AppCoordinator()
    return SettingsView().environmentObject(coordinator)
}
