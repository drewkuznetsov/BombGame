//
//  CategoryGrid.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI

struct CategoryToolbarView: View {
    var backButton: String
    var title: String
    var questionButton: String
    var onBack: () -> Void
    var onQuestion: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(backButton)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 11.71, height: 20)
                    .padding(.trailing, 65)
            }

            Text(title)
                .font(.boldRounded(fontSize: 30))
                .kerning(0.41)
                .foregroundColor(.primary)

            Button(action: onQuestion) {
                Image(systemName: questionButton)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.questionButton)
                    .padding(.leading, 53)
            }
        }
    }
}

