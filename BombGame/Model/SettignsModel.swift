//
//  SettignsModel.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/13/25.
//

enum timeSettingButton: String, CaseIterable, Identifiable {
    case short = "Короткое"
    case medium = "Среднее"
    case long = "Длинное"
    case random = "Случайное"
    var id: String { self.rawValue }
}
