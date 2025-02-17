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
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopbarComponent(cartViewModel: cartViewModel, selectedTab: $selectedTab)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        SearchBarComponent(searchText: $searchText)
                        CategoriesComponent()

                        SectionHeader(title: "Trending items")
                        ScrollableFoodListView(foodItems: trendingItems, cartViewModel: cartViewModel)
                        
                        SectionHeader(title: "Featured items")
                        ScrollableFoodListView(foodItems: featuredItems, cartViewModel: cartViewModel)
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
