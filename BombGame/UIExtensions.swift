//
//  UIComponents.swift
//  BombGame
//
//  Created by Nick Khachatryan on 10.02.2025.
//

import SwiftUI


//MARK: - FONT
extension Font {
    static func boldRounded(fontSize: CGFloat) -> Font {
        .system(size: fontSize, weight: .bold, design: .rounded)
    }
    
    static func regularRounded(fontSize: CGFloat) -> Font {
        .system(size: fontSize, design: .rounded)
    }
}


//MARK: - COLOR
extension Color {
    static let categoryChosen = Color("categoryChosen")
    static let categoryCellBG = Color("categoryCellBG")
    static let categorySheetBG = Color("categorySheetBG")
    static let gameBackground = Color("gameBackground")
    static let gameViewButton = Color("gameViewButton")
    static let mainBackground = Color("mainBackground")
    static let mainSheetBG = Color("mainSheetBG")
    static let mainViewButton = Color("mainViewButton")
    static let categoryGrid = Color("categoryGrid")
    static let questionButton = Color("questionButtonColor")
    static let primary = Color("primary")
    static let secondary = Color("secondary")
    
}
