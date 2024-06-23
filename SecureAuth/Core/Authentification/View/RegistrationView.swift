//
//  RegistrationView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                Color.secondaryYellow200.edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    //Image
                    
                    Image(systemName: "sparkles")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height:120)
                        .padding(.vertical,32)
                        .foregroundColor(.neutral900)
               
                VStack(spacing:24){
                    InputView(text: $email,
                              title: "Email Adress",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    InputView(text: $fullname,
                              title: "Full Name",
                              placeholder: "Enter your name")
                    ZStack(alignment:.trailing){
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",isSecureField: true)
                    }
                        
                        ZStack(alignment:.trailing){
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password",isSecureField: true)
                            
                            if !password.isEmpty && !confirmPassword.isEmpty{
                                if password == confirmPassword{
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                }else{
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                            }
                    }
                   
                    
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                HStack{
                    Button(action: {
                        Task{
                            try await viewModel.createUser(
                                withEmail:email,
                                password:password,
                                fullname:fullname)
                        }
                    }, label: {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                        
                    })
                    .foregroundColor((.neutral200))
                   
                    .frame(width:UIScreen.main.bounds.width - 32, height: 48)
                    
                }
                .background(Color.primary800)
               // .disabled(formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                
                // sign in button
                .padding(.horizontal)
                .padding(.top,12)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack(spacing:2){
                            Text("Already have an account ? ")
                            Text("Sign in")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.primary800)
                    })
            }
        }
        }
    }
}

extension RegistrationView:AuthenticationFormProtocol{
    
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullname.isEmpty
        && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
