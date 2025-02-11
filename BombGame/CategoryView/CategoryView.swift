//
//  CategoryView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//


import SwiftUI

struct CategoryView: View {
    // MARK: - Properties
    @State private var tappedCategory: Category? = nil
    @State private var selectedCategories: Set<Category> = []
    @ObservedObject var viewModel: CategoryViewModel
    let backButton = "Arrow"
    let title = "Категории"
    let questionButton = "questionmark.circle.fill"
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ZStack {
            Image("Topographic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height:900)
                .clipped()
            VStack {
                CategoryToolbarView(
                    backButton: backButton,
                    title: title,
                    questionButton: questionButton,
                    onBack: {
                        // back button action
                    },
                    onQuestion: {
                        //  question button action
                    }
                )
                .padding(.top,70)
                
                LazyVGrid(columns: adaptiveColumn, spacing: 33) {
                    ForEach(Category.allCases) { category in
                        CategoryButtonView(
                            category: category,
                            isSelected:selectedCategories.contains(category),
                            onSelect: {
                                if selectedCategories.contains(category) {
                                    selectedCategories.remove(category)
                                    
                                } else {
                                    selectedCategories.insert(category)
                                }
                            }
                        )
                    }
                }
                .padding(.top, 88)
                Spacer()
            }
        }
    }
}

#Preview {
    CategoryView(viewModel: CategoryViewModel(fileName: "categories"))
}

