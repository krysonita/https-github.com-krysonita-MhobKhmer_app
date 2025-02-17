//
//  LoginView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false

    var body: some View {
        VStack {
            // Header
            VStack {
                Image(systemName: "leaf.fill") // Replace with app logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                Text("Feedo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            .padding(.top, 20)

            Text("Login")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text("Please enter your registration email and password")
                .font(.caption)
                .foregroundColor(.gray)

            // Tab Selection
            HStack {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.red)
                    .underline()
                Spacer()
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Input Fields
            VStack(alignment: .leading, spacing: 15) {
                CustomTextField(icon: "envelope", placeholder: "Exemple@gmail.com", text: $email)
                CustomTextField(icon: "lock", placeholder: "Enter your password", text: $password, isSecure: true)

                HStack {
                    CheckboxButton(isChecked: $rememberMe)
                    Spacer()
                    Text("Forgot password?")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding()

            // Login Button
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()

            // OR Divider
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                Text("or")
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Social Login Buttons
            VStack {
                SocialLoginButton(icon: "globe", text: "Sign in with Google")
                SocialLoginButton(icon: "person.2.fill", text: "Sign in with Facebook")
            }

            Spacer()

            // Sign Up Link
            HStack {
                Text("I don’t have an account.")
                Text("Sign Up")
                    .foregroundColor(.red)
                    .bold()
            }
            .padding()
        }
        .padding()
    }
}
