//
//  ParsingService.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI
import Foundation

import Foundation
class ParsingService: ObservableObject {
    //MARK: - Properties
    @Published var categories: [CategoryModel] = []
    @Published var currentQuestions: [String] = []
    
    init(fileName: String = "questions") {
        loadCategories(from: fileName)
    }
    //MARK: - Parsing Json
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
      
    func loadQuestions(for selectedCategories: Set<Category>) {
        self.currentQuestions = categories
            .filter { category in
                if let validCategory = Category(rawValue: category.name) {
                    return selectedCategories.contains(validCategory)
                }
                return false
            }
            .flatMap { $0.questions }
        
        print("Loaded questions: \(currentQuestions)")
    }
}

