//
//  SettingsSection.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/14/25.
//

import SwiftUI

struct SettingsSection<Content: View>: View {
    let height: CGFloat
    let content: Content
    
    init(height: CGFloat, @ViewBuilder content: () -> Content) {
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(width: 342, height: height)
        .background(Color.categoryCellBG)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black, lineWidth: 1))
    }
}
