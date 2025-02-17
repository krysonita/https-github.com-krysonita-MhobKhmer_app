//
//  FoodCardComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct FoodCardComponent: View {
    var food: FoodItem

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(food.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 120)
                    .cornerRadius(10)
                
                VStack {
                    Image(food.restaurantLogo)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    Spacer()
                }
                .padding(5)

                Text("-15%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .offset(x: 110, y: 5)
            }

            Text(food.name)
                .font(.headline)
                .lineLimit(1)

            HStack {
                Image(systemName: "clock")
                Text("25-30min")
                Spacer()
                Text("\(food.price)MAD")
                    .foregroundColor(.red)
            }
            .font(.caption)
            .padding(.top, 3)
        }
        .frame(width: 150)
    }
}

