//
//  MainView.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.mainBackground
            
            Image("Topographic")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.black)
                .opacity(0.1)
            
            VStack {
                CustomToolBar(title: "", leftButtonIcon: "gearWheel", leftButtonAction: {
                    //todo
                }, rightButtonIcon: "QuestionRed") {
                    //todo
                }
                
                Text("ИГРА ДЛЯ КОМПАНИИ")
                    .font(.boldRounded(fontSize: 28))
                    .shadow(radius: 8)
                
                Text("БОМБА")
                    .font(.boldRounded(fontSize: 48))
                    .shadow(radius: 8)
                
                Image("mainBombImage")
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
