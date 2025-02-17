//
//  NotificationViewModel.swift
//  kick_air
//
//  Created by Kry Sonita on 14/02/2025.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationModel]
    @Published var filter: NotificationFilter = .all  // Added filter property
    
    enum NotificationFilter {
        case all
        case unread
        case read
    }
    
    init(notifications: [NotificationModel]) {
        self.notifications = notifications
    }
    
    func markAllAsRead() {
        // Mark all notifications as read
        for index in notifications.indices {
            notifications[index].isRead = false
        }
    }
    
    // Filtered notifications based on the selected filter
    var filteredNotifications: [NotificationModel] {
        switch filter {
        case .all:
            return notifications
        case .unread:
            return notifications.filter { $0.isRead }
        case .read:
            return notifications.filter { !$0.isRead }
        }
    }
}

