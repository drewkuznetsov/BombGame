//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/10/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var selectedCategories: Set<Category> = []

     func toggleCategorySelection(_ category: Category) {
         if selectedCategories.contains(category) {
             selectedCategories.remove(category)  
         } else {
             selectedCategories.insert(category)
         }
         print("Selected categories: \(selectedCategories)")
     }
}

