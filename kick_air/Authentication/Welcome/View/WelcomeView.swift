//
//  WelcomeView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("mhobkhmer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 130)

                Text("Mhobkhmer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                VStack(spacing: 16) {
                    NavigationLink(destination: LoginView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true)) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(25)
                    }

                    NavigationLink(destination: SignUpView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true)) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .home
    return WelcomeView(selectedTab: $selectedTab)
}
