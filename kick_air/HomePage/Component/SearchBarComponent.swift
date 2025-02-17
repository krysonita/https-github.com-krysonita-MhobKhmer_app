//
//  SearchBarComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct SearchBarComponent: View {
    @Binding var searchText: String
    @State private var isSearching = false
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search for restaurants, dishes...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: searchText) { newValue in
                        // Update isSearching when searchText is not empty
                        isSearching = !newValue.isEmpty
                    }
                
                Spacer()
            }
            
            if isSearching {
                Button(action: {
                    searchText = ""  // Clear search text
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(Circle())
                }
                .padding(.trailing, 10)
            }
        }
        .padding(.top, 10)
    }
}

#Preview {
    SearchBarComponent(searchText: .constant(""))
}
