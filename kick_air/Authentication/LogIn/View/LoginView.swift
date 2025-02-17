import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isSignedUp: Bool = false
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                VStack {
                    // Header
                    VStack {
                        Image("mhobkhmer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.red)
                    }
                    .padding(.top, 20)

                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)

                    Text("Please enter your registration email and password")
                        .font(.caption)
                        .foregroundColor(.gray)

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
                        isLoggedIn = true
                    }) {
                        Text("Login")
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

                    // Sign Up Link
                    HStack {
                        Text("I don’t have an account.")
                            .font(.system(size: 18))
                        Button(action: {
                            //login
                            isSignedUp = true
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.red)
                                .bold()
                        }

                    }
                    .padding()

                    NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    .hidden()
                    NavigationLink(destination: SignUpView(selectedTab: $selectedTab).navigationBarBackButtonHidden(true), isActive: $isSignedUp) {
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
    return LoginView(selectedTab: $selectedTab)
}
