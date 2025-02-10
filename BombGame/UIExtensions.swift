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
