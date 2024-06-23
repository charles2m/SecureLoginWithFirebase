//
//  LoginView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
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
                 
                    //form fields
                    VStack(spacing:24){
                        InputView(text: $email,
                                  title: "Email Adress",
                                  placeholder: "name@example.com")
                        .autocapitalization(.none)
                        
                        InputView(text: $password, 
                                  title: "Password",
                                  placeholder: "Enter your password",isSecureField: true)
                        
                        HStack {
                            Spacer()
                            NavigationLink {
                                ForgetPasswordView()
                            } label: {
                                Text("Forgot your password ? ")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary800)
                                    .padding(.bottom,8)
                                    
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top,12)
                    HStack{
                        
                        Button(action: {
                            Task{
                                try await  viewModel.signIn(withEmail: email, password: password)
                            }
                        }, label: {
                            Text("SIGN IN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                            
                        })
                        .foregroundColor((.neutral200))
                        .frame(width:UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color.primary800)
                    .disabled(formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(10)
                    
                    // sign in button
                    Spacer()
                    // sign up button
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing:2){
                            Text("Don'thave an account ? ")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.primary800)
                    }

                }
                
            }
            
        }
    }
}

extension LoginView:AuthenticationFormProtocol{
    
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
