//
//  RulesView.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import SwiftUI

struct RulesView: View {
    
    
    //MARK: - PRIVATE PROPERTIES
    private let rulesModel = RulesModel()
    
    
    //MARK: - UI
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.categoryCellBG
                
                Image("Topographic")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.mainBackground)
                    .opacity(0.4)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 10) {
                Text("Правила Игры")
                    .font(.boldRounded(fontSize: 32))
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<rulesModel.rulesArray.count, id: \.self) { number in
                        HStack(alignment: .top, spacing: 10) {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .foregroundStyle(Color.mainBackground)
                                    .frame(height: 29)
                                    .shadow(radius: 5)
                                
                                Text("\(number + 1)")
                                    .font(.boldRounded(fontSize: 16))
                            }
                            
                            if number == 1 {
                                VStack(alignment: .center, spacing: 5) {
                                    Text(rulesModel.rulesArray[number])
                                        .font(.regularRounded(fontSize: 18))
                                        
                                    
                                    ZStack(alignment: .center) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: UIScreen.main.bounds.width * 0.5, height: 26, alignment: .leading)
                                            .foregroundStyle(Color.mainViewButton)
                                            .shadow(radius: 3)
                                        
                                        Text("Старт игры")
                                            .font(.regularRounded(fontSize: 12))
                                    }
                                }
                            } else {
                                
                                Text(rulesModel.rulesArray[number])
                                    .font(.regularRounded(fontSize: 18))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}


//MARK: - PREVIEW
#Preview {
    RulesView()
}
