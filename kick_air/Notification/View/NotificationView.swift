//
//  NotificationView.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.
//

import SwiftUI

struct NotificationView: View {
    @State private var notifications: [NotificationModel] = NotificationItem
    
    var sortedNotifications: [NotificationModel] {
        notifications.sorted {
            guard let date1 = $0.date, let date2 = $1.date else { return false }
            return date1 > date2
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    // Title
                    HStack {
                        Spacer()
                        Text("Notifications")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    // Filter Buttons
                    HStack {
                        Button(action: {}) {
                            Text("All")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.leading, 16)
                        
                        Button(action: {}) {
                            Text("Unread")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            markAllAsRead()
                        }) {
                            Text("Read All")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.red)
                                .padding(10)
                        }
                        .padding(.horizontal)
                    }

                    // Notification List
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            // Group notifications by date
                            let groupedNotifications = Dictionary(grouping: sortedNotifications) { $0.dateString }
                            
                            ForEach(groupedNotifications.keys.sorted(by: { $0 > $1 }), id: \.self) { date in
                                Text(date)
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.black.opacity(0.8))
                                    .padding(.top, 20)
                                ForEach(groupedNotifications[date] ?? []) { notification in
                                    NotificationItemComponent(notification: notification)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        
    }
    // Function to mark all notifications as read
    private func markAllAsRead() {
        notifications = notifications.map { notification in
            var updatedNotification = notification
            updatedNotification.isRead = false
            return updatedNotification
        }
    }
}


#Preview{
    NotificationView()
}
