//
//  Meal.swift
//  alimonia
//
//  Created by Tom Pietsch on 06.02.21.
//
import Foundation

struct Meal : Identifiable {
    let id = UUID()
    var name: String
    var notes: String
    var ingredients: Array<Ingredient>
}
