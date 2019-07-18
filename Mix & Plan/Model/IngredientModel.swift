//
//  Ingredient.swift
//  mc2cooking
//
//  Created by fathur rohman on 16/07/19.
//  Copyright © 2019 fathur rohman. All rights reserved.
//
import Foundation

// Query service creates Recipe objects
class IngredientModel {
    
    let id: String
    let name: String
    let imageURL: URL
    let unit: String
    var amount: Float
    
    init(id:String, name: String,  imageURL: URL, unit: String, amount:Float) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.unit = unit
        self.amount = amount
    }
    
}
