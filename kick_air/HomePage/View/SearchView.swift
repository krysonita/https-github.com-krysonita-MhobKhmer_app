//
//  SearchView.swift
//  kick_air
//
//  Created by Kry Sonita on 12/02/2025.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    
    // Selected filters
    @State private var selectedDeliveryTime: String = "10-15 min"
    @State private var selectedOffers: String = "Delivery"
    @State private var selectedRating: Int = 4

    let categories = [
        ("Burger", "🍔"), ("Sandwich", "🥪"), ("Pizza", "🍕"), ("Tacos", "🌮"),
        ("Poulet", "🍗"), ("Jus", "🥤"), ("Pates", "🍝"), ("Douceurs", "🍩"),
        ("Healthy", "🥗"), ("Tacos", "🌮")
    ]
    
    let offers = ["Delivery", "Payment", "Pick Up", "Offer"]

    let deliveryTimes = ["10-15 min", "20 min", "30 min"]
    let ratings = [1, 2, 3, 4, 5]

    var body: some View {
        VStack {
            HStack {

                TextField("Search for restaurants, dishes...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: { 
                    searchText = "";
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()

            // Category Filters
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.0) { category in
                        HStack {
                            Button(action: {
//                                print("btn tapped")
                            }) {
                                Text(category.1) // Emoji
                                Text(category.0) // Text
                             //Print button tapped
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.red.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
            }

            // Filter Section
            VStack(alignment: .leading, spacing: 15) {
                Text("Filter your search")
                    .font(.title2)

                // Offers catgories
                Text("Offers").font(.subheadline).bold()
                HStack {
                    ForEach(offers, id: \.self) { offer in
                        Button(action: {
                            selectedOffers = offer
                        }) {
                            Text(offer)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedOffers == offer ? Color.red : Color.gray.opacity(0.2))
                                .foregroundColor(selectedOffers == offer ? .white : .black)
                                .cornerRadius(20)
                        }
                    }
                }

                // Delivery Time
                Text("Deliver Time").font(.subheadline).bold()
                HStack {
                    ForEach(deliveryTimes, id: \.self) { time in
                        Button(action: {
                            selectedDeliveryTime = time
                        }) {
                            Text(time)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedDeliveryTime == time ? Color.red : Color.gray.opacity(0.2))
                                .foregroundColor(selectedDeliveryTime == time ? .white : .black)
                                .cornerRadius(20)
                        }
                    }
                }

                // Rating
                Text("Rating").font(.subheadline).bold()
                HStack {
                    ForEach(ratings, id: \.self) { rating in
                        Image(systemName: rating <= selectedRating ? "star.fill" : "star")
                            .foregroundColor(rating <= selectedRating ? .red : .gray)
                            .onTapGesture {
                                selectedRating = rating
                        }
                    }
                }
            }
            .padding()

            Spacer()

            // Search Button
            Button(action: {
                // Handle search action
            }) {
                Text("Search")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(25)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SearchView()
}
