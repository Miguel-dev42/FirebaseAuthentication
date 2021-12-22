//
//  EmailSignInViewModel.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/20/21.
//

import Foundation
import Firebase

class EmailSignInViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("error while trying to sign in. Error: \(String(describing: error))")
                return
            }
            //            Successfully signed in
            DispatchQueue.main.async {
                self?.signedIn = true
                print("log in success!")
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("error while trying to create user account. Error: \(String(describing: error))")
                return
            }
//            Successfully created account and sign in
            self?.signedIn = true
        }
    }
}
