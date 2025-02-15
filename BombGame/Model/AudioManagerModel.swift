//
//  AudioManagerModel.swift
//  BombGame
//
//  Created by Даниил Павленко on 15.02.2025.
//

import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    private var player: AVAudioPlayer?
    
    private init() {
        
        playBackgroundMusic()
    }
    
    func playBackgroundMusic() {
        if let player = player, player.isPlaying {
            return // Если уже играет, ничего не делаем
        }
        
        guard let url = Bundle.main.url(forResource: "MainTheme", withExtension: "mp3") else {
            print("Ошибка: Файл музыки не найден")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        } catch {
            print("Ошибка при воспроизведении музыки: \(error.localizedDescription)")
        }
    }
    
    func stopMusic() {
        player?.stop()
    }
}
