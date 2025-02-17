//
//  FoodItems.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var restaurantLogo: String
    var price: String
    var deliveryTime: String
    var discount: String?
}

let trendingItems = [
    FoodItem(name: "Burger", imageName: "berger", restaurantLogo: "mcdonalds", price: "45.00", deliveryTime: "25-30 min", discount: "-15%"),
    FoodItem(name: "Pizza", imageName: "pizza", restaurantLogo: "dominnos", price: "45.00", deliveryTime: "25-30 min", discount: "-15%"),
    FoodItem(name: "Hotpot", imageName: "hotpot", restaurantLogo: "dominos", price: "45.00", deliveryTime: "25-30 min", discount: "-15%")
]

let featuredItems = [
    FoodItem(name: "Burger Buffalo chicken", imageName: "wing_chic1", restaurantLogo: "mcdonalds", price: "45.00", deliveryTime: "25-30 min", discount: "-15%"),
    FoodItem(name: "Cheesy Beef burger king", imageName: "Buffelo", restaurantLogo: "burgerking", price: "45.00", deliveryTime: "25-30 min", discount: "-15%"),
    FoodItem(name: "Wing Chicken McDonalds", imageName: "food1", restaurantLogo: "burgerking", price: "45.00", deliveryTime: "25-30 min", discount: "-15%")
]


