//
//  PunishmentsViewModel.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import Foundation

class PunishmentsViewModel {

    
    //MARK: - PROPERTIES
    static let shared = PunishmentsViewModel()
    
    
    //MARK: - INITIALIZATORS
    private init() {}

    
    //MARK: - METHODS
    func getRandomPunishment() -> String {
        let allPunishments = PunishmentsModel.allCases
        let randomIndex = Int.random(in: 0..<allPunishments.count)
        return allPunishments[randomIndex].rawValue
    }
}
