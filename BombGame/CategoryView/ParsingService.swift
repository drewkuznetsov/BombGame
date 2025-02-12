//
//  ParsingService.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI
import Foundation
import Foundation
//
//class ParsingService {
//    private var categories: [CategoryModel] = []
//    private var categoryProgress: [Category: Int] = [:]
//
//    init(fileName:String =  "questions") {
//        self.categories = loadCategories(from: fileName)
//    }
//
//    private func loadCategories(from fileName: String) -> [CategoryModel] {
//        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
//            print("Failed to locate \(fileName).json in bundle.")
//            return []
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decodedData = try JSONDecoder().decode(CategoryList.self, from: data)
//            return decodedData.categories
//        } catch {
//            print("Error decoding JSON: \(error)")
//            return []
//        }
//    }
//
//    func getNextQuestion(for selectedCategories: Set<Category>, isAnswerCorrect: Bool) -> String? {
//        guard !selectedCategories.isEmpty else { return nil }
//
//        let availableCategories = categories.filter { selectedCategories.contains(Category(rawValue: $0.name)!) }
//        guard !availableCategories.isEmpty else { return nil }
//
//        let randomCategory = availableCategories.randomElement()!
//
//        let currentIndex = categoryProgress[Category(rawValue: randomCategory.name)!, default: 0]
//        if isAnswerCorrect, currentIndex < randomCategory.questions.count - 1 {
//            categoryProgress[Category(rawValue: randomCategory.name)!] = currentIndex + 1
//        }
//
//        return randomCategory.questions[categoryProgress[Category(rawValue: randomCategory.name)!, default: 0]]
//    }
//}
