//
//  ContentView.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: EmailSignInViewModel
    
    var body: some View {
        TabView {
            if viewModel.signedIn  {
                LoggedInView()
            } else {
                SignInView()
                    .tabItem {
                        VStack {
                            Image(systemName: "envelope")
                            Text("email")
                        }
                    }
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
