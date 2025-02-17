//
//  SectionHeaderComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("See All")
                .font(.subheadline)
                .foregroundColor(.red)
        }
        .padding(.top, 5)
    }
}

