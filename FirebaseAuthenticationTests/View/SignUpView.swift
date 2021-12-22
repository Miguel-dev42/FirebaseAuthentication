//
//  SignUpView.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/20/21.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var showingAlert = false
    
    @EnvironmentObject var viewModel: EmailSignInViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("emailThumb")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                
                TextField("Email", text: $email, prompt: Text("Email Address"))
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password, prompt: Text("Password"))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Confirm Password", text: $confirmPassword, prompt: Text("Confirm Password"))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password==confirmPassword else {
                        showingAlert = true
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                }, label: {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                })
            }
        }
        .padding()
        .navigationTitle("Create account")
        .alert(isPresented: $showingAlert) {
//            what to do with the alert
            Alert(title: Text("Problem creating your account"), message: Text(message), dismissButton: .default(Text("OK")))
        }
    }
    
    var message: String {
        let passNotMatching = "Password did not match, please try again"
        let unknown = "An unknown error occurred, please check your email address and try again"
        let emptyField = "All fields are required"
        if password.isEmpty || email.isEmpty || confirmPassword.isEmpty {
            return emptyField
        } else if password == password {
            return passNotMatching
        }
        return unknown
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
