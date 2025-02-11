//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    
    @State private var soundTimer: AVAudioPlayer?
    @State private var soundGong: AVAudioPlayer?
    @State private var soundBang: AVAudioPlayer?
    
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
                    isPlaying ? pauseSound() : playTimer()
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
                        PlayGong()
                        playTimer()
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

//MARK: Play Audio Sounds Extension

extension GameView {
    
    func playTimer() {
        playSound(named: "Timer", player: &soundTimer)
    }
    
    func PlayGong() {
        playSound(named: "Gong", player: &soundGong)
    }
    
    func playBang() {
        playSound(named: "Bang", player: &soundBang)
    }
    
    func pauseSound() {
            soundTimer?.pause()
        }
    
    func playSound(named fileName: String, player: inout AVAudioPlayer?) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Ошибка воспроизведения: \(error.localizedDescription)")
            }
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
