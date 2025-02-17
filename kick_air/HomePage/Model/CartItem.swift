//
//  CartItem.swift
//  kick_air
//
//  Created by Kry Sonita on 14/02/2025.
//
import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var food: FoodItem
    var quantity: Int
    var totalPrice: Double
}
