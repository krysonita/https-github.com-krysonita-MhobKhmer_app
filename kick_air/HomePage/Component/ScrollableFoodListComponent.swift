//
//  ScrollableFoodListComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct ScrollableFoodListComponent: View {
    var foodItems: [FoodItem]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(foodItems) { food in
                    FoodCardComponent(food: food)
                }
            }
        }
    }
}

