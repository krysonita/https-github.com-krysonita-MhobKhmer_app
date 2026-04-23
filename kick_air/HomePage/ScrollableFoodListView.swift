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
//import SwiftUI
//struct ScrollableFoodListView: View {
//    let foodItems: [FoodItem]
//    @ObservedObject var cartViewModel: CartViewModel
//    
//    var body: some View {
//        LazyVStack(spacing: 16) {
//            ForEach(foodItems, id: \.id) { item in
//                HStack(spacing: 12) {
//                    Image(item.imageName)
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                        .cornerRadius(10)
//                    
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text(item.name)
//                            .font(.headline)
//                        
//                        Text("$\(item.price)")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                        
//                        Text(item.deliveryTime)
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        cartViewModel.addToCart(item)
//                    }) {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title2)
//                            .foregroundColor(.orange)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}
