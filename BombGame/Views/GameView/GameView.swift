//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    // MARK: - Properties
    @ObservedObject var parsingService: ParsingService
    @EnvironmentObject var appCoordinator: AppCoordinator
    var selectedCategory: Category
    
    @State private var currentQuestion: String = ""
    // MARK: - Game State
    @State private var soundTimer: AVAudioPlayer?
    @State private var soundGong: AVAudioPlayer?
    @State private var soundBang: AVAudioPlayer?
    // MARK: - Animation
    @State private var animationProgress: CGFloat = 0
    @State private var remainingTime: Double = 10
    @State private var timer: Timer?
    // MARK: - Audio
    @State var isPlaying = false
    @State var startPlaying = false
    
    let totalTime: Double = 10// Общее время (для вычисления прогресса)
    let extraTime: Double = 1 // Время для финального скачка до 100%
    
    let labelText = "Нажмите \"запустить\" \n чтобы начать игру."
    let questionText = "Назовите виды зимнего спорта"
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                BackgroundImage()
                
                Color.gameBackground
                    .opacity(0.5)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 10) {
                //MARK: Custom ToolBar
                CustomToolBar(title: "Игра",
                              leftButtonIcon: "Arrow", leftButtonAction: {
                    
                    appCoordinator.pop()
                }, rightButtonIcon: isPlaying ? "Pause" : "Play") {
                    // Play Button Action
                    isPlaying ? pauseGame() : playGame()
                }
                
                Spacer()
                
                //MARK: Label
                Text(isPlaying ? currentQuestion : labelText)
                    .font(Font.regularRounded(fontSize: 28))
                    .bold(isPlaying)
                    .multilineTextAlignment(.center)
                Text("\(Int(remainingTime))")
                
                Spacer()
                
                LottieView(animationName: "bomb2", loopMode: .playOnce, animationProgress: $animationProgress)
                    .frame(width: 350)
                
                Spacer()
                
                //MARK: Start Button
                if (!startPlaying) {
                    CustomButton(title: "Запустить",
                                 backgroundColor: Color.gameViewButton) {
                        startGame()
                    }
                } else {
                    CustomButton(title: "Запустить",
                                 backgroundColor: Color.gameViewButton) {
                        startGame()
                    }
                                 .hidden()
                }
            }
        }
        
        .onAppear {
            updateAnimationProgress()
            loadRandomQuestion()
        }
    }
}



//MARK: - Animation

extension GameView {
    func updateAnimationProgress() {
        
        if remainingTime > extraTime {
            // Первые 30 секунд (точнее, пока currentTime > extraTime): прогресс до 70%
            let timeLeftFor70 = remainingTime - extraTime // Время, которое осталось для плавной части
            animationProgress = CGFloat((totalTime - timeLeftFor70) / totalTime) * 0.5 // Прогресс рассчитываем относительно totalTime
        } else {
            // После (или когда currentTime <= extraTime): быстрая анимация до 100%
            let progressBeyond70Percent = min((extraTime - remainingTime) / extraTime, 3.0)
            //  Сколько прошло времени с 70%
            animationProgress = 0.2 + CGFloat(progressBeyond70Percent) * 0.6
            print("prog:",progressBeyond70Percent)
        }
        print("anim:", animationProgress)
        // Убедимся, что прогресс не выходит за пределы 0...1
        animationProgress = min(max(animationProgress, 0), 1)
    }
}


//MARK: - Load a Random Question
extension GameView {
    private func loadRandomQuestion() {
        let questions = parsingService.categories
            .first(where: { $0.name == selectedCategory.rawValue })?
            .questions ?? []
        
        if let question = questions.randomElement() {
            currentQuestion = question
        } else {
            currentQuestion = "Нет доступных вопросов."
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
        startPlaying.toggle()
    }
    
    private func pauseGame() {
        pauseSound()
        stopTimer()
        isPlaying.toggle()
    }
    
    private func playGame() {
        
        guard startPlaying
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
        startPlaying.toggle()
        remainingTime = 10
    }
}

//MARK: Timer Extension
extension GameView {
    
    func startTimer() {
        stopTimer() // Остановка предыдущего таймера, если есть
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 0.01
            } else {
                stopTimer()
                stopGame()
            }
            updateAnimationProgress()
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
        GameView(parsingService: ParsingService(), selectedCategory: .cinema)
    }
}
