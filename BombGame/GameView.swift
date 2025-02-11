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
    let questionText = "Назовите улицы Москвы"
    
    var body: some View {
        
        ZStack {
            
                
                // BackGround Image
                Image("Topographic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height:900)
                    .clipped()
            
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
                Spacer()
                
                //MARK: Label
                Text(isPlaying ? questionText : labelText)
                    .font(Font.regularRounded(fontSize: 28))
                    .bold(isPlaying)
                    .multilineTextAlignment(.center)
                Spacer()
                
                //MARK: Bomb Image
                Image("imageBomb")
                    .resizable()
                    .frame(width: 312,height: 350)
                Spacer()

                
                //MARK: Start Button
                
                if (!isPlaying) {
                    CustomButton(title: "Запустить",
                                 backgroundColor: Color.gameViewButton) {
                        // Start button action
                        isPlaying.toggle()
                    }
                }
                
                Spacer()
                Spacer()

            }
        
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
