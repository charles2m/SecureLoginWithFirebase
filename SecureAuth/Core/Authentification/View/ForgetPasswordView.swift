//
//  ForgetPasswordView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 19/06/2024.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel:AuthViewModel
    var body: some View {
        ZStack {
            Color.secondaryYellow200.edgesIgnoringSafeArea(.all)
            
            VStack(spacing:20){
                HStack {
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width:20,height:16)
                            .foregroundColor(.neutral900)
                        
                    })
                    Spacer()
                }
                 
                Image(systemName: "sparkles")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height:60)
                    .padding(.vertical,32)
                    .foregroundColor(.neutral900)
                HStack {
                    Text("Ajoutez votre email ici pour récupérer votre mot de passe.")
                        .font(.title3)
                        .foregroundColor(.neutral900)
                    Spacer()
                   
                }
                
                TextField("Email", text: $email)
                    .font(.title3)
                    .textFieldStyle((RoundedBorderTextFieldStyle()))
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                Button(action: {
                             viewModel.forgotPassword(for: email)
                         }) {
                             Text("Réinitialiser le mot de passe")
                                 .foregroundColor((.neutral200))
                                 .frame(width:UIScreen.main.bounds.width - 32, height: 48)
                         }
                         .background(Color.primary800)
                         .fontWeight(.bold)
                         .cornerRadius(10)
                         .padding(.bottom,8)
                        

                         if let errString = viewModel.errString {
                             Text(errString)
                                 .foregroundColor(.red)
                                 .padding()
                         }

                         if let successMessage = viewModel.successMessage {
                             Text(successMessage)
                                 .foregroundColor(.green)
                                 .padding()
                         }
                    
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ForgetPasswordView()
}
