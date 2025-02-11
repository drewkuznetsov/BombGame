//
//  ParsingService.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import SwiftUI
import Foundation

class ParsingService {
    static func parseStringsFile(named fileName: String) -> [CategoryModel] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "strings"),
              let fileContent = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("Не удалось загрузить \(fileName).strings")
            return []
        }

        var categories: [String: (description: String, questions: [String])] = [:]

        let lines = fileContent.split(separator: "\n")
        
        var currentCategory: String?
        var currentDescription: String?

        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Пропускаем пустые строки или комментарии
            if trimmedLine.isEmpty || trimmedLine.hasPrefix("/*") {
                continue
            }
            
            if trimmedLine.hasPrefix("\"Category_") {
                let categoryKey = trimmedLine.replacingOccurrences(of: "\"Category_", with: "").replacingOccurrences(of: "\" =", with: "")
                currentCategory = categoryKey
                categories[categoryKey] = (description: "", questions: [])
            } else if trimmedLine.hasPrefix("\"Description_") {
                let descriptionValue = trimmedLine.replacingOccurrences(of: "\"Description_", with: "").replacingOccurrences(of: "\" =", with: "")
                currentDescription = descriptionValue
                if let currentCategory = currentCategory {
                    categories[currentCategory]?.description = descriptionValue
                }
            } else if let currentCategory = currentCategory, trimmedLine.hasPrefix("\"") {
                let question = trimmedLine.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: " =", with: "")
                categories[currentCategory]?.questions.append(question)
            }
        }

        return categories.map { key, value in
            CategoryModel(category: key, description: value.description,
                          questions: value.questions.map { QuestionModel(question: $0) })
        }
    }
}
