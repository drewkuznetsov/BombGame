//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published   var categories: [CategoryModel] = []

        init(fileName: String = "CatAndQuestions") {
            self.categories = ParsingService.parseStringsFile(named: fileName)
        }

        func getQuestions(from selectedCategories: Set<String>) -> [QuestionModel] {
            return categories
                .filter { selectedCategories.contains($0.category) }
                .flatMap { $0.questions }
        }

}
