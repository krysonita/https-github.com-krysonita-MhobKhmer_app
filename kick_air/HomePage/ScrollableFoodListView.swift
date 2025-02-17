//
//  ScrollableFoodListView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct ScrollableFoodListView: View {
    var foodItems: [FoodItem]
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(foodItems) { food in
                    NavigationLink(destination: FoodDetailView(food: food, cartViewModel: cartViewModel)) {
                        FoodCardComponent(food: food)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

