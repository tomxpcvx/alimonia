//
//  Ingredient.swift
//  alimonia
//
//  Created by Tom Pietsch on 06.02.21.
//
import Foundation

struct CIngredient: Identifiable {
    let id = UUID()
    var name: String
    var amount: Int32
    var uom: CUom
    
    init(name: String, amount: Int32, uom: CUom) {
        self.name = name
        self.amount = amount
        self.uom = uom
    }
}
