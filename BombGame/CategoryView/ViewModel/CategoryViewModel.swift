//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories: [CategoryModel] = []
    @Published var currentQuestion: String = ""
       private var currentQuestionIndex: Int = 0

      init(fileName: String) {
          loadCategories(from: "questions")
      }

      func loadCategories(from fileName: String) {
          guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
              print("Failed to locate \(fileName).json in bundle.")
              return
          }

          do {
              let data = try Data(contentsOf: url)
              let decodedData = try JSONDecoder().decode(CategoryList.self, from: data)
              self.categories = decodedData.categories
          } catch {
              print("Error decoding JSON: \(error)")
          }
      }

    func getNextQuestion(for category: Category, isAnswerCorrect: Bool) {
            guard let categoryData = categories.first(where: { $0.name == category.rawValue }) else {
                return
            }

            if isAnswerCorrect {
                if currentQuestionIndex < categoryData.questions.count - 1 {
                    currentQuestionIndex += 1
                }
            }

            currentQuestion = categoryData.questions[currentQuestionIndex]
        }
}
