//
//  NotificationItemComponent.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.
//

import SwiftUI

// Notification Item View
struct NotificationItemComponent: View {
    @State private var isAtive: Bool = false
    var notification: NotificationModel
    let formatter = RelativeDateTimeFormatter()
    var body: some View {
        HStack(spacing: 15) {
            Image(notification.image)
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text(notification.title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)

                Text(notification.message)
                    .font(.system(size: 15))
                    .foregroundColor(.gray.opacity(0.8))
                    .lineLimit(1)

                HStack{
                    Text(notification.food)
                        .font(.system(size: 15))
                        .foregroundColor(.red)
                    Spacer()
                    Text(formatter.localizedString(for: notification.time, relativeTo: Date()))
                        .font(.system(size: 13))
                        .foregroundColor(.black)
                }
            }
            VStack(alignment: .trailing) {
                VStack(alignment: .trailing) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(notification.isRead ? Color.green : Color.gray.opacity(0))
                        .offset(x:5, y: -35)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}
