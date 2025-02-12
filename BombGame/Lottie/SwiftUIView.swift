//
//  SwiftUIView.swift
//  TestApp
//
//  Created by Даниил Павленко on 11.02.2025.
//

import SwiftUI

struct TimerView: View {
    @State private var currentTime: Double = 30 // Начальное время
    @State private var timer: Timer? = nil
    @State private var isTimerRunning = false
    @State private var animationProgress: CGFloat = 0
    let totalTime: Double = 30 // Общее время (для вычисления прогресса)
    let extraTime: Double = 1.0 // Время для финального скачка до 100%
    @State private var animationCompleted = false

    var body: some View {
        ZStack {
            LottieView(animationName: "bomb2", loopMode: .playOnce, animationProgress: $animationProgress)
                .frame(width: 900, height: 900)
            
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        if isTimerRunning {
                            stopTimer()
                        } else {
                            startTimer()
                        }
                    }) {
                        Text(isTimerRunning ? "Стоп" : "Старт")
                    }
                    
                    Text("\(Int(currentTime)) сек")
                }
                Spacer()
                Spacer()
            }
            
        }
        .onAppear {
            updateAnimationProgress()
        }
    }

    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            currentTime -= 0.01
            if currentTime <= 0 {
                stopTimer()
                currentTime = 0
            }
            updateAnimationProgress()
        }
    }

    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }

    func updateAnimationProgress() {
        if currentTime > extraTime {
            // Первые 30 секунд (точнее, пока currentTime > extraTime): прогресс до 70%
            let timeLeftFor70 = currentTime - extraTime // Время, которое осталось для плавной части
            animationProgress = CGFloat((totalTime - timeLeftFor70) / totalTime) * 0.7 // Прогресс рассчитываем относительно totalTime
        } else {
            // После (или когда currentTime <= extraTime): быстрая анимация до 100%
             let progressBeyond70Percent = min((extraTime - currentTime) / extraTime, 7.0) //  Сколько прошло времени с 70%
            animationProgress = 0.7 + CGFloat(progressBeyond70Percent) * 0.7

            if progressBeyond70Percent >= 1.0 {
                animationCompleted = true
            }
        }

        // Убедимся, что прогресс не выходит за пределы 0...1
        animationProgress = min(max(animationProgress, 0), 1)
    }
}

#Preview {
    TimerView()
}
