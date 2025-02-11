//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI

struct GameView: View {
    
    @State var isPlaying = false
    
    var body: some View {
        
        ZStack {
            
// BackGround Image
            Image("Topographic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height:900)
                .clipped()
            
// Custom ToolBar
            CustomToolBar(title: "Игра",
                          leftButtonIcon: "Arrow", leftButtonAction: {
                
                // Back Button Action
                
            }, rightButtonIcon: isPlaying ? "Pause" : "Play") {
                // Play Button Action
                self.isPlaying.toggle()
            }
            

        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
