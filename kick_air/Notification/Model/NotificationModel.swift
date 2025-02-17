//
//  NotificationModel.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.
//

import SwiftUI

struct NotificationModel: Identifiable {
    var id: UUID = UUID()
    var image: String 
    var title: String
    var message: String
    var food: String
    var time: Date
    var isRead: Bool
    var dateString: String

        var date: Date? {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            return formatter.date(from: dateString)
        }
}

let NotificationItem = [
    NotificationModel(image: "berger",title: "New Order", message: "You have a new order", food: "Burger",time: Date(timeIntervalSinceNow: -30), isRead: true, dateString: "27 Feb 2025"),
    NotificationModel(image: "pizza",title: "Payment Received", message: "Payment received for your order", food: "Pizza",time: Date(timeIntervalSinceNow: -60), isRead: false, dateString: "26 Feb 2025"),
    NotificationModel(image: "wing_chic1",title: "Order Shipped", message: "Your order has been shipped", food: "Hotpot", time: Date(timeIntervalSinceNow: -120), isRead: true, dateString: "25 Feb 2025"),
    NotificationModel(image: "berger",title: "New Order", message: "You have a new order", food: "Burger",time: Date(timeIntervalSinceNow: -50), isRead: true, dateString: "24 Feb 2025")
]
