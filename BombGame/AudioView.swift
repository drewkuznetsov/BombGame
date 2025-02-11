//
//  AudioView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI
import AVFoundation

struct AudioView: View {
    
    @State private var soundTimer: AVAudioPlayer?
    @State private var soundGong: AVAudioPlayer?
    @State private var soundBang: AVAudioPlayer?
    
    var body: some View {
        VStack(spacing: 20) {
            Button("🔊 Воспроизвести звук 1") {
                playTimer()
            }
            
            Button("🔊 Воспроизвести звук 2") {
                PlayGong()
            }
            
            Button("🔊 Воспроизвести звук 3") {
                playBang()
            }
            
            Button("🔊 Pause") {
                pauseSound()
            }
            
        }
    }
    
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

struct AudioView_Previews: PreviewProvider {
    static var previews: some View {
        AudioView()
    }
}
