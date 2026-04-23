//
//  MyCartView.swift
//  kick_air
//
//  Created by Kry Sonita on 08/04/2025.
//

import SwiftUI

struct MyCartView: View {
    var order: [OrderList]
    var body: some View {
        NavigationView{
            HStack(spacing: 15) {
                ForEach(order) { orders in
                    OrderCardsComponent(order: orders)
                }
            }
        }
        .navigationTitle("My Cart")
    }
}

#Preview {
//    MyCartView(order: OrderL)
}
