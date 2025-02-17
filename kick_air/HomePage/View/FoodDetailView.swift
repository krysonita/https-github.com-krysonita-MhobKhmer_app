//
//  FoodDetailView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct FoodDetailView: View {
    @Environment(\.dismiss) var dismiss
    var food: FoodItem
    @State private var quantity = 1
    @State private var selectedSauce: String?
    @State private var selectedDrink: String?
    @State private var isFavorite: Bool = false
    @ObservedObject var cartViewModel: CartViewModel

    let sauces = ["Algerian", "Biggy Burger"]
    let drinks = ["Coca-cola", "Pepsi", "ICE"]
    let drinkPrice = 6.00

    var totalPrice: Double {
        let formattedPrice = food.price.replacingOccurrences(of: ",", with: ".")
        let basePrice = Double(formattedPrice) ?? 0
        let drinkCost = selectedDrink != nil ? drinkPrice : 0
        return (basePrice + drinkCost) * Double(quantity)
    }

    var body: some View {
        ZStack(alignment: .top) {  // Keeps the buttons fixed
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Image(food.imageName)
                        .resizable()
                        .scaledToFit()
                    
                    // Restaurant Info
                    HStack {
                        Image(food.restaurantLogo)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        
                        Text("McDonald's")
                            .font(.headline)
                        
                        Spacer()
                        
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("4.5")
                            Text("(1,523)")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)

                    // Food Details
                    Text(food.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Green salad - Tomato - Minced meat - Cheese fromage")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    // Price & Quantity Selector
                    HStack {
                        Text("\(food.price) KH/$")
                            .font(.title2)
                            .foregroundColor(.red)
                            .fontWeight(.bold)

                        Spacer()

                        HStack {
                            Button(action: {
                                if quantity > 1 { quantity -= 1 }
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.red)
                            }

                            Text("\(quantity)")
                                .font(.title2)
                                .frame(width: 30)

                            Button(action: {
                                quantity += 1
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Sauce Options
                    Text("Choose your sauces")
                        .font(.headline)

                    ForEach(sauces, id: \.self) { sauce in
                        HStack {
                            Text(sauce)
                            Spacer()
                            RadioButton(selectedOption: $selectedSauce, option: sauce)
                        }
                    }

                    // Drink Options
                    Text("Would you like a drink?")
                        .font(.headline)

                    ForEach(drinks, id: \.self) { drink in
                        HStack {
                            Text(drink)
                            Spacer()
                            Text("+\(drinkPrice, specifier: "%.2f") KH/$")
                                .foregroundColor(.gray)
                            RadioButton(selectedOption: $selectedDrink, option: drink)
                        }
                    }

                    // Add to Cart Button
                    Button(action: {
                        cartViewModel.addItemToCart(food: food, quantity: quantity, totalPrice: totalPrice)
                        dismiss()
                    }) {
                        Text("Add \(quantity) for \(totalPrice, specifier: "%.2f") KH/$")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.vertical)
                }
                .padding()
            }

            // Fixed Buttons
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(13)
                        .background(Circle().fill(Color.black.opacity(0.3)))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.clear)
        }
        .navigationBarHidden(true)
    }
}


#Preview {
    FoodDetailView(food: FoodItem(name: "Burger", imageName: "wing_chic1", restaurantLogo: "mcdonalds", price: "45,00", deliveryTime: "25-30 min", discount: "-15%"), cartViewModel: CartViewModel())
}
