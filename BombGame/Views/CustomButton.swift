//
//  CustomButton.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Text(title)
                .frame(width: 330, height: 55)
                .bold()
                .foregroundColor(Color.primaryColor)
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .shadow(radius: 3)
        
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Hello", backgroundColor: Color.gameViewButton) {
            
        }
    }
}
