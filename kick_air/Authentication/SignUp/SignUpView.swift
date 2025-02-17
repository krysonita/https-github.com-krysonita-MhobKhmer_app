//
//  SignUpView.swift
//  kick_air
//
//  Created by Kry Sonita on 11/02/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text("Please enter your registration details")
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.red)
                    .underline()
            }
            .padding(.horizontal)

            // Input Fields
            VStack(alignment: .leading, spacing: 15) {
                TextField("First name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                HStack {
                    CheckboxButton(isChecked: $rememberMe)
                    Spacer()
                    Text("Forgot password?")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding()

            // Sign-Up Button
            Button(action: {
                // Handle sign-up action
            }) {
                Text("Sign Up")
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
                SocialLoginButton(icon: "google", text: "Sign in with Google")
                SocialLoginButton(icon: "facebook", text: "Sign in with Facebook")
            }

            Spacer()

            // Login Link
            HStack {
                Text("Already have an account?")
                Text("Login")
                    .foregroundColor(.red)
                    .bold()
            }
            .padding()
        }
        .padding()
    }
}
