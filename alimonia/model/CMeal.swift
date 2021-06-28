//
//  Meal.swift
//  alimonia
//
//  Created by Tom Pietsch on 06.02.21.
//
import Foundation

struct CMeal : Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var notes: String?
    var ingredients: Array<CIngredient>
}
