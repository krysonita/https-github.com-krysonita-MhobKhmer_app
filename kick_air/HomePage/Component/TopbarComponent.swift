//
//  TopbarComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct TopbarComponent: View {
    @ObservedObject var cartViewModel: CartViewModel
    @State private var showMenu = false
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                Image("mhobkhmer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                
                Text("Mhobkhmer")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack(spacing: 16) {
                    ZStack {
                        Image(systemName: "cart")
                        
                        if cartViewModel.cartCount > 0 {
                            Text("\(cartViewModel.cartCount)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                        }
                    }
                    
                    Image(systemName: "plus.circle")
                    
                    // Dropdown Menu for History, Wishlist, and Orders
                    Menu {
                        
                        // Navigate to History View (You can add a HistoryView if needed)
                        Button(action: {
                            print("History selected")
                        }) {
                            Label("History", systemImage: "clock")
                        }
                        
                        // Navigate to WishlistView
                        NavigationLink(destination: WishlistView(selectedTab: $selectedTab, cartViewModel: cartViewModel)) {
                            Label("Wishlist", systemImage: "heart")
                        }
                        //Navigate to FoodDetailView
                        NavigationLink(destination: FoodDetailView(food: FoodItem(name: "Sample", imageName: "sampleImage", restaurantLogo: "sampleLogo", price: "10.00", deliveryTime: "30-40 min", discount: "-10%"), cartViewModel: cartViewModel)) {
                            Label("Orders", systemImage: "list.bullet")
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }
                }
                .foregroundColor(.black)
                .font(.title3)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .background(Color.white)
    }
}


#Preview {
    TopbarComponent(cartViewModel: CartViewModel(), selectedTab: .constant(.home))
}
