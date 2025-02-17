//
//  CartViewModel.swift
//  kick_air
//
//  Created by Kry Sonita on 14/02/2025.
//
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartCount: Int = 0 // Tracks total items in cart
    @Published var cartItems: [CartItem] = [] // Store cart items

    func addItemToCart(food: FoodItem, quantity: Int, totalPrice: Double) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            // If the item is already in the cart, update the quantity
            cartItems[index].quantity += quantity
        } else {
            // Otherwise, add a new cart item
            let newItem = CartItem(food: food, quantity: quantity, totalPrice: totalPrice)
            cartItems.append(newItem)
        }

        // Update total cart count
        cartCount = cartItems.reduce(0) { $0 + $1.quantity }

        print("Added \(quantity) \(food.name) to cart. Total items: \(cartCount)")
    }
}


