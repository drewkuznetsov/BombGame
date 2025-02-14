//
//  SettingsToggleButton.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/14/25.
//
import SwiftUI

struct SettingsToggleButton: View {
    var title: String
    @Binding var isOn: Bool
    var action: (Bool) -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.regularRounded(fontSize: 16).weight(.black))
                .foregroundColor(.white)
                .padding(.trailing, 20)
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: .mainBackground))
                .labelsHidden()
                .onChange(of: isOn) { newValue in
                    action(newValue)
                }
        }
        .padding(.horizontal)
        .frame(width: 308, height: 49)
        .background(Color.primary.opacity(0.7))
        .cornerRadius(15)
        .padding(.bottom,8)
        
    }
}
