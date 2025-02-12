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
    
    @State private var remainingTime = 10
    @State private var timer: Timer?
    
    @State var isPlaying = false
    @State var startPlaing = false
    
    let labelText = "Нажмите \"запустить\" \n чтобы начать игру."
    let questionText = "Назовите виды зимнего спорта"
    
    var body: some View {
        
        NavigationView {
            
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
                        isPlaying ? pauseGame() : playGame()
                    }
                    
                    //MARK: Label
                    Text(isPlaying ? questionText : labelText)
                        .font(Font.regularRounded(fontSize: 28))
                        .bold(isPlaying)
                        .multilineTextAlignment(.center)
                    Text("\(remainingTime)")
                    Spacer()
                    
                    
                    
                    
                    //MARK: Start Button
                    if (!startPlaing) {
                        CustomButton(title: "Запустить",
                                     backgroundColor: Color.gameViewButton) {
                           startGame()
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
}

//MARK: Function Extension

extension GameView {
    
    private func startGame() {
        PlayGongSound()
        playTimerSound()
        startTimer()
        isPlaying.toggle()
        startPlaing.toggle()
    }
    
    private func pauseGame() {
        pauseSound()
        stopTimer()
        isPlaying.toggle()
    }
    
    private func playGame() {
        
        guard startPlaing
        else {
            startGame()
            return
        }
        
        startTimer()
        playTimerSound()
        isPlaying.toggle()
    }
    
    private func stopGame() {
        playBangSound()
        pauseSound()
        isPlaying.toggle()
        startPlaing.toggle()
        remainingTime = 10
    }
}

//MARK: Timer Extension
extension GameView {
    
    func startTimer() {
            stopTimer() // Остановка предыдущего таймера, если есть
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if remainingTime > 0 {
                    remainingTime -= 1
                } else {
                    stopTimer()
                    stopGame()
                }
            }
        }
        
        func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
}

//MARK: Play Audio Sounds Extension

extension GameView {
    
    func playTimerSound() {
        playSound(named: "Timer", player: &soundTimer)
    }
    
    func PlayGongSound() {
        playSound(named: "Gong", player: &soundGong)
    }
    
    func playBangSound() {
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
