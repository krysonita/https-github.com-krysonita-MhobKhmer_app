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
                Spacer()
            }
                Button(action: {
                    isSearching = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Circle())
                }
        }
        .padding(.top, 10)
    }
}


