//
//  SignInView.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/20/21.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
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
                    .disableAutocorrection(true)
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else { return }
                    viewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                })
                
                NavigationLink("Don't have and Account?", destination: SignUpView())
                Spacer()
            }
            .padding()
            .navigationTitle("Sign In")
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
