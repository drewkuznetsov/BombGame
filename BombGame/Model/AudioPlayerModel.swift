//
//  AudioPlayerModel.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI
import AVFoundation

class soundPlayer {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    init(audioPlayer: AVAudioPlayer? = nil) {
        self.audioPlayer = audioPlayer
    }
    
    private func playSound(fileName: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Ошибка воспроизведения: \(error.localizedDescription)")
            }
        } else {
            print("Файл не найден!")
        }
    }
    
    func playTimer() {
        playSound(fileName: "Timer")
    }
    
}


