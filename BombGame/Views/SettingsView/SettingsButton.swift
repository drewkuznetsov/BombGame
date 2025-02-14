//
//  SettingsButton.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/14/25.
//

import SwiftUI

struct SettingsButton: View {
    var title: String
    var option: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.regularRounded(fontSize: 16).weight(.black))
                    .foregroundColor(.white)
                    .padding(.leading,10)
                Spacer()
                    
              
                HStack {
                    Text(option)
                        .font(.regularRounded(fontSize: 14))
                        .foregroundColor(Color.settingsMusic)
                        .offset(x:4)
                    Image("ArrowRight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        
                }
                .padding(.leading, 8)
            }
            .padding(.horizontal,8)
        }
        .frame(width: 308, height: 49)
        .background(Color.primary.opacity(0.7))
        .cornerRadius(15)
        .padding(.bottom, 12)
    }
}
