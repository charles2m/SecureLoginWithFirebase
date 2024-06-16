//
//  ProfileView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
   
        HStack {
            
            Button(action: {
              
            }, label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width:20,height:16)
                    .foregroundColor(.neutral900)
                
            })
            Spacer()
       
            Text(User.MOCK_USER.fullname)
                    .bold()
                
                Menu {
                    Button(action: {
                       
                    }) {
                        Text("Se déconnecter")
                        
                    }
                    
                    Button(action: {
                       
                    }) {
                        Text("Effacer son compte")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                       
                }
            
        }
        .foregroundColor(.neutral900)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
