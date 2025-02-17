//
//  CheckboxButton.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct CheckboxButton: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .red : .gray)
                    .imageScale(.large)
                
                Text("Remember me")
                    .foregroundColor(.black)
            }
        }
    }
}
