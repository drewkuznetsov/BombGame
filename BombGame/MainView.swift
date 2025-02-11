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
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
