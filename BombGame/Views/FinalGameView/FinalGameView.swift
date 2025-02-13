//
//  FinalGameView.swift
//  BombGame
//
//  Created by Даниил Павленко on 13.02.2025.
//

import SwiftUI

struct FinalGameView: View {
    
    @ObservedObject var punishmentsViewModel = PunishmentsViewModel()
    
    @State var punishments = ""
    
    var body: some View {
        NavigationView {
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
                            
                            Text(punishments)
                                .font(Font.boldRounded(fontSize: 30))
                                .foregroundStyle(Color.primaryColor)
                                .multilineTextAlignment(.center)
                                .lineLimit(5)
                                .frame(height: geometry.size.height * 0.3)
                            
                            CustomButton(title: "Другое задание",
                                         backgroundColor: Color.gameViewButton) {
                                punishments = punishmentsViewModel.getRandomPunishment()
                            }
                            
                            CustomButton(title: "Начать заново",
                                         backgroundColor: Color.gameViewButton) {
                                print("переход на GameView")
                            }
                        }
                        .frame(width: geometry.size.width-10)
                        
                        Spacer()
                    }
                }
                .onAppear() {
                    punishments = punishmentsViewModel.getRandomPunishment()
                }
            }
            
        }
    }
}

#Preview {
    FinalGameView()
}
