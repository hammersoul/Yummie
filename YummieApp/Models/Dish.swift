//
//  Dish.swift
//  YummieApp
//
//  Created by Тимофей Кубышин on 2023-07-05.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
