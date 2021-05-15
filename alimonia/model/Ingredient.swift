//
//  Ingredient.swift
//  alimonia
//
//  Created by Tom Pietsch on 06.02.21.
//
import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var amount: Int32
    var uom: Uom
    
    init(name: String, amount: Int32, uom: Uom) {
        self.name = name
        self.amount = amount
        self.uom = uom
    }
}
