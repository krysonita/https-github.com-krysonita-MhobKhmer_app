//
//  AllFoodItemsView.swift
//  kick_air
//
//  Created by Kry Sonita on 07/04/2025.
//

import SwiftUI

//struct AllFoodItemsView: View {
//    @Binding var searchText: String
////    var sectionType: FoodSectionType
//    var sectionType: FoodSectionType
//    @StateObject var cartViewModel = CartViewModel()
//
//    var filteredItems: [FoodItem] {
//        let baseItems: [FoodItem] = {
//            switch sectionType {
//            case .trending: return trendingItems
//            case .featured: return featuredItems
//            }
//        }()
//        
//        return baseItems.filter { item in
//            searchText.isEmpty || item.name.lowercased().contains(searchText.lowercased())
//        }
//    }
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 16) {
//                    if filteredItems.isEmpty {
//                        Text("No results found.")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                            .padding()
//                    } else {
////                        ScrollableAllFoodListView(foodItems: filteredItems, cartViewModel: cartViewModel)
//                        ScrollableFoodListView(foodItems: filteredItems, cartViewModel: cartViewModel)
//                    }
//                }
//                .padding(.top, 20)
//            }
//            .navigationTitle(sectionType == .trending ? "Trending Items" : "Featured Items")
//        }
//    }
//}
//
////#Preview {
////    @Previewable @State var searchText = ""
////    AllFoodItemsView(searchText: $searchText, sectionType: )
////}

struct AllFoodItemsView: View {
    @Binding var searchText: String
    var sectionType: FoodSectionType
    
    @StateObject private var cartViewModel = CartViewModel()
    
    var filteredItems: [FoodItem] {
        sectionType.items.filter { item in
            searchText.isEmpty ||
            item.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    if filteredItems.isEmpty {
                        Text("No results found.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ScrollableFoodListView(
                            foodItems: filteredItems,
                            cartViewModel: cartViewModel
                        )
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle(sectionType.title)
        }
    }
}

struct AllFoodItemsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}

struct PreviewWrapper: View {
    @State private var searchText = ""
    
    var body: some View {
        AllFoodItemsView(
            searchText: $searchText,
            sectionType: .trending
        )
    }
}
