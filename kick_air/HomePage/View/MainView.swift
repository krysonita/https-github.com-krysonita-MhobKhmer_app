import SwiftUI

enum Tab {
    case home
    case search
    case wishlist
    case notification
    case profile
}

struct MainView: View {
    @State private var selectedTab: Tab = .home
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedTab) {
                    // Home Page View
                    HomePageView(selectedTab: $selectedTab, searchText: $searchText)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(Tab.home)
                    
                    // Search Page View
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(Tab.search)

                    // Wishlist Page View
                    WishlistView(selectedTab: $selectedTab, cartViewModel: CartViewModel())
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Wishlist")
                        }
                        .tag(Tab.wishlist)
                    // Notification Page View
                    NotificationView()
                        .tabItem {
                            Image(systemName: "bell")
                            Text("Notification")
                        }
                        .tag(Tab.notification)
                    
                    // Profile Page View
                    ProfileView(selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                    .tag(Tab.profile)
                }
                .accentColor(.red)
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    MainView()
}
