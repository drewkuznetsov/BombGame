//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI

struct GameView: View {
    
    @State var isPlaying = false
    
    let labelText = "Нажмите \"запустить\" \n чтобы начать игру."
    let questionText = "Назовите виды зимнего спорта"
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            BackgroundImage()
            Color.gameBackground
                .opacity(0.5)
            
            VStack {
                
                //MARK: Custom ToolBar
                CustomToolBar(title: "Игра",
                              leftButtonIcon: "Arrow", leftButtonAction: {
                    
                    // Back Button Action
                    
                }, rightButtonIcon: isPlaying ? "Pause" : "Play") {
                    // Play Button Action
                    self.isPlaying.toggle()
                }
                .padding(.top, 70)
                
                
                //MARK: Label
                Text(isPlaying ? questionText : labelText)
                    .font(Font.regularRounded(fontSize: 28))
                    .bold(isPlaying)
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                //MARK: Start Button
                if (!isPlaying) {
                    CustomButton(title: "Запустить",
                                 backgroundColor: Color.gameViewButton) {
                        // Start button action
                        isPlaying.toggle()
                    }
                                 .padding(.bottom, 90)
                }
            }
            
            //MARK: Bomb Image
            Image("imageBomb")
                .resizable()
                .frame(width: 312,height: 350)
            Spacer()
            
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
