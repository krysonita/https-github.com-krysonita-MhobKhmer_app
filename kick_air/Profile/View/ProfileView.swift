//
//  ProfileView.swift
//  kick_air
//
//  Created by Kry Sonita on 12/02/2025.
//


import SwiftUI

struct ProfileView: View {
    @Binding var selectedTab: Tab
    @State private var isLoggedOut: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(spacing: 8) {
                        Image("berger")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange, lineWidth: 2.5))
                        
                        Text("Kry Sonita")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("example@cmail.com")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                }
                
                // Account Section
                Section(header: Text("Account").font(.headline)) {
                    NavigationLink(destination: EditProfileView()) {
                        ProfileMenuItem(icon: "pencil", title: "Edit Profile")
                    }
                    NavigationLink(destination: OrderHistoryView()) {
                        ProfileMenuItem(icon: "cart", title: "Order History")
                    }
                    NavigationLink(destination: ShippingDetailsView()) {
                        ProfileMenuItem(icon: "map", title: "Shipping Details")
                    }
                }
                
                // Offers Section
                Section(header: Text("Offers").font(.headline)) {
                    NavigationLink(destination: CouponsView()) {
                        ProfileMenuItem(icon: "ticket", title: "All Coupons")
                    }
                }
                
                // Security Section
                Section(header: Text("Security").font(.headline)) {
                    NavigationLink(destination: ChangePasswordView()) {
                        ProfileMenuItem(icon: "lock", title: "Change Password")
                    }
                }
                
                // Logout Section
                Section {
                    NavigationLink(destination: WelcomeView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true)) {
                        ProfileMenuItem(icon: "power", title: "Log Out", isLogout: true)
                    }
                }
            }
            .listSectionSeparator(.hidden)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Profile")
        }
    }
}

struct EditProfileView: View {
    var body: some View {
        Text("Edit Profile Page").font(.title)
            .navigationTitle("Edit Profile")
    }
}

struct OrderHistoryView: View {
    var body: some View {
        Text("Order History Page").font(.title)
            .navigationTitle("Order History")
    }
}

struct ShippingDetailsView: View {
    var body: some View {
        Text("Shipping Details Page").font(.title)
            .navigationTitle("Shipping Details")
    }
}

struct CouponsView: View {
    var body: some View {
        Text("All Coupons Page").font(.title)
            .navigationTitle("All Coupons")
    }
}

struct ChangePasswordView: View {
    var body: some View {
        Text("Change Password Page").font(.title)
            .navigationTitle("Change Password")
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .profile
    return ProfileView(selectedTab: $selectedTab)
}
