//
//  PunishmentsViewModel.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import Foundation

class PunishmentsViewModel: ObservableObject {

    
    //MARK: - METHODS
    func getRandomPunishment() -> String{
        let allPunishments = PunishmentsModel.allCases
        let randomIndex = Int.random(in: 0...allPunishments.count-1)
        return allPunishments[randomIndex].rawValue
    }
}
