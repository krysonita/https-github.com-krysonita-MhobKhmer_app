//
//  CategoriesComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct CategoriesComponent: View {
    let categories = ["Burger", "Sandwich", "Pizza", "Taco", "Khmer Food", "Other"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        //Navigate to
                    }) {
                        Text(category)
                            .font(.system(size:18, weight: .medium))
                            .foregroundColor(.black)
                            .padding(14)
//                            .border(.gray.opacity(0.2))
                            .background(.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .padding(.vertical, 10)
    }
}
#Preview {
    CategoriesComponent()
}
