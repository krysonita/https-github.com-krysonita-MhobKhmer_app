//
//  WishLish.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.

import SwiftUI

struct WishlistItem: Identifiable {
    let id = UUID()
    let food: FoodItem
}

let SampleWishlistItems = [
    WishlistItem(food: FoodItem(name: "Burger Buffalo Chicken", imageName: "berger", restaurantLogo: "mcdonalds", price: "8.00", deliveryTime: "25-30 min", discount: "-15%")),
    WishlistItem(food: FoodItem(name: "Cheesy Beef Burger King", imageName: "pizza", restaurantLogo: "burgerking", price: "7.00", deliveryTime: "20-25 min", discount: "-10%")),
    WishlistItem(food: FoodItem(name: "Chicken Wings", imageName: "wing_chic1", restaurantLogo: "kfc", price: "5.00", deliveryTime: "30-35 min", discount: "-5%"))
]
