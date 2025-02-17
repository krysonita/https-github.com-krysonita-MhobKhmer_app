//
//  WishlistView.swift
//  kick_air
//
//  Created by Kry Sonita on 12/02/2025.
//
import SwiftUI

struct WishlistView: View {
    @State private var wishlistItems: [WishlistItem] = SampleWishlistItems
    @Binding var selectedTab: Tab
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Spacer()
                        Text("Wishlist")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                List {
                    ForEach(wishlistItems) { item in
                        NavigationLink(destination: FoodDetailView(food: item.food, cartViewModel: cartViewModel)) {
                            HStack {
                                Image(item.food.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.trailing, 12)

                                VStack(alignment: .leading, spacing: 10) {
                                    Text(item.food.name)
                                        .font(.headline)

                                    Text(item.food.price + " KH/$")
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                        .fontWeight(.bold)
                                }

                                Spacer()

                                // Heart Button
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .home
    return WishlistView(selectedTab: $selectedTab,cartViewModel: CartViewModel())
}

