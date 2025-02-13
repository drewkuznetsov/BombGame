//
//  BackgroundImage.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        // BackGround Image
        Image("Topographic")
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .foregroundStyle(.black)
            .opacity(0.2)
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
