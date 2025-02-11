//
//  AudioView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI
import AVFoundation

struct AudioView: View {
    
    @State private var audioPlayer: AVAudioPlayer?

       var body: some View {
           VStack {
               Button("🔊 Воспроизвести звук") {
                   playSound()
               }
           }
       }

       func playSound() {
           if let soundURL = Bundle.main.url(forResource: "Gong", withExtension: "mp3") {
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
}

struct AudioView_Previews: PreviewProvider {
    static var previews: some View {
        AudioView()
    }
}
