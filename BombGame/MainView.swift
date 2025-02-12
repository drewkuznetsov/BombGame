//
//  MainView.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import SwiftUI

struct MainView: View {
    
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                ZStack {
                    Color.mainBackground
                    
                    Image("Topographic")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.black)
                        .opacity(0.1)
                }
                .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    CustomToolBar(title: "", leftButtonIcon: "gearWheel", leftButtonAction: {
                        isPresented.toggle()
                    }, rightButtonIcon: "QuestionRed") {
                        //todo
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
                        //todo
                    }
                    
                    CustomButton(title: "Категории", backgroundColor: .mainViewButton) {
                        //todo
                    }
                    
                }
                
            }
            .border(.red)
        }
        .sheet(isPresented: $isPresented) {
            RulesView()
                .presentationDetents([.fraction(0.754)])
                .presentationDragIndicator(.visible)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    MainView()
}
