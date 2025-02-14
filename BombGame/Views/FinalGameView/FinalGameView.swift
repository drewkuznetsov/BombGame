//
//  FinalGameView.swift
//  BombGame
//
//  Created by Даниил Павленко on 13.02.2025.
//

import SwiftUI

struct FinalGameView: View {
    
    //    @ObservedObject var punishmentsViewModel = PunishmentsViewModel()
    @State private var punishment: String = PunishmentsViewModel.shared.getRandomPunishment()
    @State private var lastPunishment: String? = nil
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        
            ZStack(alignment: .top) {
                ZStack {
                    BackgroundImage()
                    
                    Color.gameBackground
                        .opacity(0.5)
                }
                .ignoresSafeArea()
                
                GeometryReader { geometry in
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 30) {
                            Text("Конец игры")
                                .font(Font.boldRounded(fontSize: 40))
                                .foregroundStyle(Color.primaryColor)
                            
                            Image("EndGame")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                            
                            Text(punishment)
                                .font(Font.boldRounded(fontSize: 30))
                                .foregroundStyle(Color.primaryColor)
                                .multilineTextAlignment(.center)
                                .lineLimit(5)
                                .frame(height: geometry.size.height * 0.3)
                            
                            CustomButton(title: "Другое задание",
                                         backgroundColor: Color.gameViewButton) {
                                checkPunishment()
                            }
                            
                            CustomButton(title: "Начать заново",
                                         backgroundColor: Color.gameViewButton) {
                                coordinator.push(.mainView)
                            }
                        }
                        .frame(width: geometry.size.width-10)
                        
                        Spacer()
                    }
                }
                .onAppear() {
                    punishment = PunishmentsViewModel.shared.getRandomPunishment()
                }
            }
    }
    
    
    //MARK: - METHODS
    func checkPunishment() {
        var newPunishment: String
        
        repeat {
            newPunishment = PunishmentsViewModel.shared.getRandomPunishment()
        } while newPunishment == lastPunishment
                    
        punishment = newPunishment
        lastPunishment = newPunishment
    }
}

#Preview {
    let coordinator = AppCoordinator()
    FinalGameView()
        .environmentObject(coordinator)
}
