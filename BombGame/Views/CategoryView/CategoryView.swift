//
//  CategoryView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI

struct CategoryView: View {
    @State private var showingSheet: Bool = false
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var viewModel: CategoryViewModel
    @ObservedObject var parsingService: ParsingService
    
    let backButton = "Arrow"
    let title = "Категории"
    let questionButton = "questionmark.circle.fill"

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
            ZStack(alignment: .top) {
                ZStack {
                    Color.mainSheetBG
                    BackgroundImage()
                }
                .ignoresSafeArea()
                
                VStack {
                    CategoryToolbarView(
                        backButton: backButton,
                        title: title,
                        questionButton: questionButton,
                        onBack: {
                            coordinator.pop()
                        },
                        onQuestion: {
                            showingSheet.toggle()
                        }
                    )
                    .padding(.top,30)

                    .sheet(isPresented: $showingSheet) {
                        HelpCategoryView()
                            .presentationDetents([.fraction(0.9)])
                    }
                    
                    LazyVGrid(columns: adaptiveColumn, spacing: 33) {
                        ForEach(Category.allCases) { category in
                            CategoryButtonView(
                                category: category,
                                isSelected: viewModel.selectedCategories.contains(category),
                                iconName: category.categoryIcon,
                                forceCheckmark: false,
                                onSelect: {
                    viewModel.toggleCategorySelection(category)
                                }
                            )
                           
                        }
                    }
                    .padding(.top, 80)
                        .alignmentGuide(VerticalAlignment.center) { _ in 50 * 7.7 }
                  
                }
            }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let appCoordinator = AppCoordinator()
        let viewModel = CategoryViewModel()
        CategoryView(parsingService: ParsingService())
            .environmentObject(appCoordinator)
            .environmentObject(viewModel)
    }
}
