//
//  Untitled.swift
//  BombGame
//
//  Created by Tatiana Lanskaya on 15.02.2025.
//

import SwiftUI

enum GameTime: String, CaseIterable, Identifiable  {
    case shot = "Короткое"
    case medium = "Среднее"
    case long = "Длинное"
    case random = "Случайное"
    
    func getGameTime() -> Int {
        switch self {
        case .shot:
            return 10
        case .medium:
            return 20
        case .long:
            return 45
        case .random:
            return Int.random(in: 10...45)
        }
    }
    
    var id: String { self.rawValue }
}

enum MelodiName: String, CaseIterable, Identifiable  {
    
    case melodi1 = "Мелодия 1"
    case melodi2 = "Мелодия 2"
    case melodi3 = "Мелодия 3"
    
    func getMelodiFile() -> String {
        switch self {
            
        case .melodi1:
            return "MainTheme"
        case .melodi2:
            return "Melodi2"
        case .melodi3:
            return "Melodi3"
        }
    }
    
    var id: String { self.rawValue }
}

enum TimerSound: String, CaseIterable, Identifiable  {
    case timerSound1 = "Таймер 1"
    case timerSound2 = "Таймер 2"
    case timerSound3 = "Таймер 3"
    
    func getTimerSoundFile() -> String {
        switch self {
            
        case .timerSound1:
            return "Timer"
        case .timerSound2:
            return "Timer2"
        case .timerSound3:
            return "Timer3"
        }
    }
    
    var id: String { self.rawValue }
}

enum BangSound: String, CaseIterable, Identifiable {
    case bangSound1 = "Взрыв 1"
    case bangSound2 = "Взрыв 2"
    case bangSound3 = "Взрыв 3"
    
    func getbangSoundFile() -> String {
        switch self {
            
        case .bangSound1:
            "Bang"
        case .bangSound2:
            "Bang2"
        case .bangSound3:
            "Bang3"

        }
    }
    
    var id: String { self.rawValue }
}


class SettingsModel: ObservableObject {
    
    @ObservedObject static var shared = SettingsModel()
    
    @Published var gameTime = GameTime.shot
    
    @Published var melodiName = MelodiName.melodi2
    
    @Published var timerSound = TimerSound.timerSound1
    
    @Published var bangSound = BangSound.bangSound3
    
    @Published var switchVibrate = true
    
    @Published var switchPunishments = true
    
    func printChanges() {
        print(gameTime.getGameTime())
        print(melodiName.getMelodiFile())
        print(timerSound.getTimerSoundFile())
        print(bangSound.getbangSoundFile())
        print(switchVibrate)
        print(switchPunishments)
    }
    
    init() { }
}
