//
//  HomePageView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

// HomePageView
struct HomePageView: View {
    @Binding var selectedTab: Tab
    @Binding var searchText: String
    @StateObject var cartViewModel = CartViewModel()

    // Filtered items based on searchText
    var filteredTrendingItems: [FoodItem] {
        trendingItems.filter { foodItem in
            searchText.isEmpty || foodItem.name.lowercased().contains(searchText.lowercased())
        }
    }

    var filteredFeaturedItems: [FoodItem] {
        featuredItems.filter { foodItem in
            searchText.isEmpty || foodItem.name.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopbarComponent(cartViewModel: cartViewModel, selectedTab: $selectedTab)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        SearchBarComponent(searchText: $searchText)
                        CategoriesComponent()

//                        SectionHeader(title: "Trending items", hasNodata: true)
//                        ScrollableFoodListView(foodItems: filteredTrendingItems, cartViewModel: cartViewModel)
//
//                        SectionHeader(title: "Featured items", hasNodata: true)
//                        ScrollableFoodListView(foodItems: filteredFeaturedItems, cartViewModel: cartViewModel)
                        SectionHeader(title: "Trending items", hasNodata: filteredTrendingItems.isEmpty)
                        if filteredTrendingItems.isEmpty {
                            Text("No data found")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        } else {
                            ScrollableFoodListView(foodItems: filteredTrendingItems, cartViewModel: cartViewModel)
                        }

                        SectionHeader(title: "Featured items", hasNodata: filteredFeaturedItems.isEmpty)
                        if filteredFeaturedItems.isEmpty {
                            Text("No data found")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        } else {
                            ScrollableFoodListView(foodItems: filteredFeaturedItems, cartViewModel: cartViewModel)
                        }

                    }
                    .padding(.horizontal)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


#Preview {
    @Previewable @State var selectedTab: Tab = .home
    @Previewable @State var searchText = ""
    HomePageView(selectedTab: $selectedTab, searchText: $searchText)
}
