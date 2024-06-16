//
//  LoginView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            NavigationStack{
                
                VStack{
                    
                    //Image
                    
                    Image(systemName: "sparkles")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height:120)
                        .padding(.vertical,32)
                        .foregroundColor(.neutral900)
                    Spacer()
                    //form fields
                    
                    // sign in button
                    
                    // sign up button
                    
                }
                
            }
            
        }
    }
}

#Preview {
    LoginView()
}
