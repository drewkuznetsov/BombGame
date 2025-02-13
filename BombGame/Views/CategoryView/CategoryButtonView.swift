//
//  CategoryButtonView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI

struct CategoryButtonView: View {
    let category: Category
    let isSelected: Bool
    let iconName: String
    let forceCheckmark: Bool
    let onSelect: () -> Void

    var body: some View {
        Button(action: onSelect) {
            VStack(spacing: 3) {
                if forceCheckmark || isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 50 * 2)
                        .foregroundColor(.black)
                }
                
                Image(iconName) 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                Text(category.rawValue)
                    .font(.boldRounded(fontSize: 16))
                    .foregroundColor(.primary)
            }
            .frame(width: 150, height: 150)
            .background(isSelected ? Color.categoryChosen : Color.categoryGrid)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 1)
            )
        }
        .fixedSize()
    }
}
