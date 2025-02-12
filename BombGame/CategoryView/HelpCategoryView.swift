//
//  Untitled.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/11/25.
//

import SwiftUI

struct HelpCategoryView: View {
    let title: String = "Правила игры"
    let subtitle: String = "В игре доступно 6 \n категорий и более 90\n вопросов."
    let rules: String  = "Можно выбрать сразу \n несколько категорий для \n игры."
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]

    
    private let filteredCategories: [Category] = Category.allCases.filter { $0 != .cinema && $0 != .nature }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                BackgroundImage()
                Color.categorySheetBG.opacity(0.8)
                   
                VStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 68, height: 3)
                            .foregroundColor(Color.primaryColor) 
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    HStack {
                        Text(title)
                            .font(.boldRounded(fontSize: 30))
                            .foregroundColor(.primaryColor)
                    }
                    .padding(.top,6)
                    
                    Text(subtitle)
                        .font(.boldRounded(fontSize: 24))
                        .foregroundColor(.primaryColor)
                        .padding(.leading).padding(.top,26)
                        .multilineTextAlignment(.center)
                    
                    Text(rules)
                        .font(.regularRounded(fontSize: 24))
                        .foregroundColor(.primaryColor)
                        .multilineTextAlignment(.center)
                        .padding(.top, 41)
                    
                    LazyVGrid(columns: adaptiveColumn, spacing: 33) {
                        ForEach(filteredCategories) { category in
                            CategoryButtonView(
                                category: category,
                                isSelected: false,
                                iconName: category.helpCategoryIcon, forceCheckmark: true,
                                onSelect: { }
                            )
                        }
                    }
                }
          
            }
        }
    }
}


#Preview {
    HelpCategoryView()
}
