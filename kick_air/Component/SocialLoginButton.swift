//
//  SocialLoginButton.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct SocialLoginButton: View {
    var icon: String
    var text: String
    
    var body: some View {
        Button(action: {
            // Handle social login
        }) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text(text)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }
        .padding(.horizontal)
    }
}

