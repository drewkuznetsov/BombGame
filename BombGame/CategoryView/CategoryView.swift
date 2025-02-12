//
//  CategoryView.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//


import SwiftUI


struct CategoryView: View {
    @State private var selectedCategories: Set<Category> = []
    @State private var currentCategory: Category? = nil // Tracks the active category
    @State private var showingSheet: Bool = false
    @ObservedObject var viewModel: CategoryViewModel

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
                        // Back button action
                    },
                    onQuestion: {
                        showingSheet.toggle()
                    }
                )
                .sheet(isPresented: $showingSheet) {
                    HelpCategoryView()
                        .presentationDetents([.fraction(0.9)])
                }
                .padding(.top, 70)

                LazyVGrid(columns: adaptiveColumn, spacing: 33) {
                    ForEach(Category.allCases) { category in
                        CategoryButtonView(
                            category: category,
                            isSelected: selectedCategories.contains(category),
                            iconName: category.categoryIcon,
                            forceCheckmark: false,
                            onSelect: {
                                if selectedCategories.contains(category) {
                                    selectedCategories.remove(category)
                                } else {
                                    selectedCategories.insert(category)
                                    currentCategory = category
                                    viewModel.getNextQuestion(for: category, isAnswerCorrect: true) 
                                }
                            }
                        )
                    }
                }
                .padding(.top, 40)

//                if let category = currentCategory {
//                    VStack {
//                        Text(viewModel.currentQuestion.isEmpty ? "Выберите категорию" : viewModel.currentQuestion)
//                            .font(.title)
//                            .foregroundColor(.black)
//                            .padding()
//                            .multilineTextAlignment(.center)
//
//                        HStack {
//                            Button("Правильный ответ") {
//                                viewModel.getNextQuestion(for: category, isAnswerCorrect: true)
//                            }
//                            .padding()
//                            .background(Color.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//
//                            Button("Неправильный ответ") {
//                                print("проиграл")
//                            }
//                            .padding()
//                            .background(Color.red)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                        }
//                    }
//                    .padding(.top, 30)
//                }
                
                Spacer()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: CategoryViewModel(fileName: "categories"))
    }
}
