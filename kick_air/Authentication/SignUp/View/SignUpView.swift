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
    @State private var isSignedUp: Bool = false
    @State private var isLoggedIn: Bool = false
    @Binding var selectedTab : Tab
    

    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack {
                    // Header
                    VStack {
                        Image("mhobkhmer") // Replace with app logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.red)
                    }
                    .padding(.top, 20)

                    Text("Sign Up")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)

                    Text("Please enter your registration details")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding()

                    // Input Fields
                    VStack(alignment: .leading, spacing: 12) {
                        CustomTextField(icon: "person.crop.circle", placeholder: "First name", text: $firstName, isSecure: false)
                        
                        CustomTextField(icon: "envelope", placeholder: "Email", text: $email, isSecure: false)
                        
                        CustomTextField(icon: "eye", placeholder: "password", text: $password, isSecure: true)
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
                        isSignedUp = true
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(25)
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
                        SocialLoginButton(icon: "Google", text: "Sign in with Google")
                        SocialLoginButton(icon: "Facebook", text: "Sign in with Facebook")
                    }
                    Spacer()

                    // Login Link
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 18))
                        Button(action: {
                            //login
                            isLoggedIn.toggle()
                        }) {
                            Text("Login")
                                .foregroundColor(.red)
                                .bold()
                        }
                    }
                    .padding()
                    NavigationLink(destination:LoginView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true), isActive: $isSignedUp) {
                            EmptyView()
                        }
                    .hidden()
                    NavigationLink(destination:LoginView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true), isActive: $isLoggedIn) {
                            EmptyView()
                        }
                    .hidden()
                }
                .padding()
            }
            }
        }
}

#Preview {
    @Previewable @State var selectedTab: Tab = .home
    return SignUpView(selectedTab: $selectedTab)
}
