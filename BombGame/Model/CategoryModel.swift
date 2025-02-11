//
//  CategoryModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//


struct CategoryModel {
    var category: String
    var description: String
    var questions: [QuestionModel]
    var isSelected: Bool = false  
}


struct QuestionModel {
    var question : String
}


enum Category: String, CaseIterable, Identifiable {
    case general = "О разном"
    case sport = "Спорт и Хобби"
    case life = "Про Жизнь"
    case celebrities = "Знаменитости"
    case cinema = "Искусство и Кино"
    case nature = "Природа"
    var id: String { rawValue }
    
    var categoryIcon: String {
        switch self {
        case .general:
            return "general"
        case .sport:
            return "sport"
        case .life:
            return "life"
        case .celebrities:
            return "celebrities"
        case .cinema:
            return "cinema"
        case .nature:
            return "nature"
        }
    }
}
