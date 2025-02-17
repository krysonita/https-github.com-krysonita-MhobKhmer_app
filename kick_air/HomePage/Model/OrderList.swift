//
//  OrderList.swift
//  kick_air
//
//  Created by Kry Sonita on 17/02/2025.
//

import SwiftUI

struct OrderList: Identifiable {
    let id = UUID()
    var name: String
    var status: String
    var hour: String
}

let orderList = [
    OrderList(name: "Order 1", status: "Pending", hour: "2h"),
    OrderList(name: "Order 2", status: "Pending", hour: "now"),
    OrderList(name: "Order 3", status: "Pending", hour: "3h"),
]
