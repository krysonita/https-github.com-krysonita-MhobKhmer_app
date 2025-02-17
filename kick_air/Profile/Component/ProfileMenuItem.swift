//
//  ProfileMenuItem.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.
//
import SwiftUI

struct ProfileMenuItem: View {
    var icon: String
    var title: String
    var isLogout: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(isLogout ? .red : .gray)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(isLogout ? .red : .black)
            
            Spacer()

//            if !isLogout {
////                Image(systemName: "chevron.right")
////                    .foregroundColor(.gray)
//            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ProfileMenuItem(icon: "person.crop.circle", title: "jjjj", isLogout: true)
}
