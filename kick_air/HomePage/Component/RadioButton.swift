//
//  RadioButton.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct RadioButton: View {
    @Binding var selectedOption: String?
    var option: String

    var body: some View {
        Button(action: {
            selectedOption = option
        }) {
            Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                .foregroundColor(selectedOption == option ? .red : .gray)
                .font(.title2)
        }
    }
}


