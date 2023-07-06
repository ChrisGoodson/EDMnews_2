//
//  SignInView.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import Foundation
import SwiftUI

struct SignInView: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                (Text("EDMnews Sign in")
                    .foregroundColor(.red)
                )
                .font(.title)
                .lineSpacing(5)
                .padding(.top, 20)
                .padding(.trailing, 30)
                
                InputField(text: $signInViewModel.cellPhoneNumber, num: "Enter a phone number(12282575217)")
                    .disabled(signInViewModel.displayConfirmation)
                    .padding(.top, 50)
                InputField(text: $signInViewModel.confirmationCode, num: "Enter confirmation code(111111)")
                    .disabled(!signInViewModel.displayConfirmation)
                    .padding(.top, 15)
                
                Button(action: signInViewModel.displayConfirmation ? signInViewModel.verifyConfirmationCode : signInViewModel.sendConfirmationCode){
                    HStack(spacing: 15) {
                        Text(signInViewModel.displayConfirmation ? "Verify Code" : "Send Code")
                            .contentTransition(.identity)
                    }
                    .foregroundColor(.blue)
                    .padding(.vertical)
                }
                .padding(.top, 5)
            }
            .padding(.leading, 69)
            .padding(.vertical, 17)
        }
        .alert(signInViewModel.errorMsg, isPresented: $signInViewModel.displayError) {
        }
    }
}

