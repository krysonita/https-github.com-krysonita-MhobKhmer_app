//
//  OrderCardsComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 17/02/2025.
//

import SwiftUI

struct OrderCardsComponent: View {
    var order: OrderList
    var body: some View {
        List{
            VStack{
                HStack {
                    Image("pizza")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5){
                        Text(order.name)
                            .font(.system(size: 20))
                        Text(order.status)
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    VStack(spacing: 40){
                        Button(action: {
                            //Show dropdown
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.red)
                                .font(.system(size: 20))
                        }
                        Text(order.hour)
                            .font(.system(size: 16))
                    }
                }
            }
        }
    }
}

#Preview {
    OrderCardsComponent(order: OrderList(name: "Order1", status: "Pending", hour: "2h"))
}
