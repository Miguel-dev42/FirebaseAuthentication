//
//  LoggedInView.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/19/21.
//

import SwiftUI

struct LoggedInView: View {
    @EnvironmentObject var viewModel: EmailSignInViewModel
    
    var body: some View {
        VStack {
            Text("You have successfully signed in. \n Way to go you!!!")
            Button {
                viewModel.signedIn = false
            } label: {
                Text("Sign out")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
