//
//  CategoryModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

struct CategoryList: Codable {
    let categories: [CategoryModel]
}

struct CategoryModel: Codable, Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let questions: [String]
}


enum Category: String, CaseIterable, Identifiable {
    case general = "О Разном"
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
    
    var helpCategoryIcon: String {
        switch self {
        case .general:
            return "general1"
        case .sport:
            return "sport"
        case .life:
            return  "life"
        case .celebrities:
            return "celebrities"
        case .cinema:
            return ""
        case .nature:
            return ""
        }
    }
}
