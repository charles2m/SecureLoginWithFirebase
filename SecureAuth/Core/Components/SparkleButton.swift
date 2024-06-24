//
//  SparkleButton.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 23/06/2024.
//

import SwiftUI

struct SparkleButton: View {
   @Binding var buttonStates:Int
    @Binding var navigate:Bool

    var body: some View {
        
        
        
        
        Button(action: {
            withAnimation {
                buttonStates += 1
                if  buttonStates == 2 {
                    navigate = true
                    buttonStates = 0 // Réinitialiser le compteur après la navigation
                    
                    print("BUTTON STATE : \(navigate)")
                    print("BUTTON STATE : \(buttonStates)")
                }
            }
        }) {
            HStack {
                Image(systemName: "sparkles")
                    .transition(.opacity)
                Text( buttonStates < 1 ? "" : "Rejoindre")
                    .transition(.opacity)
                Image(systemName: "chevron.right")
                    .transition(.opacity)
            }
            .padding()
            .background(.primary800)
            .foregroundColor(.neutral200)
            .cornerRadius(8)
        }
        
        
    }
            }
            
    


#Preview {
    SparkleButton(buttonStates: .constant(0), navigate: .constant(true))
}
