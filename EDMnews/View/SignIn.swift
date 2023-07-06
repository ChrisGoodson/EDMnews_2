//
//  SignIn.swift
//  firebaseAuthentication
//
//  Created by Chris on 7/05/23.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignIn: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
   // @StateObject var signInViewModel: SignInViewModel = .init()
    var body: some View {
        if signInViewModel.isSignedIn {
            SignedInView()
        } else {
            SignInView()
        }
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
