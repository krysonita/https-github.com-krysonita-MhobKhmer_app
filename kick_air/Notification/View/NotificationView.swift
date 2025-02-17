//
//  NotificationView.swift
//  kick_air
//
//  Created by Kry Sonita on 13/02/2025.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel: NotificationViewModel
    
    init(notifications: [NotificationModel]) {
        _viewModel = StateObject(wrappedValue: NotificationViewModel(notifications: notifications))
    }
    
    var sortedNotifications: [NotificationModel] {
        viewModel.filteredNotifications.sorted {
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
                        Button(action: {
                            viewModel.filter = .all
                        }) {
                            Text("All")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(viewModel.filter == .all ? Color.red : Color.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.leading, 16)
                        
                        Button(action: {
                            viewModel.filter = .unread
                        }) {
                            Text("Unread")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(viewModel.filter == .unread ? Color.red : Color.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.markAllAsRead()
                        }) {
                            Text("ReadAll")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(viewModel.filter == .read ? Color.red : Color.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
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
}

#Preview{
    NotificationView(notifications: NotificationItem)
}
