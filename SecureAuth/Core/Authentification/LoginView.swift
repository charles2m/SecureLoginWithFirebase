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
                        
                    }
                    .padding(.horizontal)
                    .padding(.top,12)
                    HStack{
                        Button(action: {
                            print("Log user in...")
                        }, label: {
                            Text("Sign In")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                            
                        })
                        .foregroundColor((.neutral200))
                        .frame(width:UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color.primary800)
                    .cornerRadius(10)
                    
                    // sign in button
                    Spacer()
                    // sign up button
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing:2){
                            Text("Don'thave an account ? ")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }

                }
                
            }
            
        }
    }
}

#Preview {
    LoginView()
}
