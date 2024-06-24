//
//  TweetRowView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 23/06/2024.
//

import SwiftUI

struct FeedItemView: View {
    @State var buttonStates:Int = 0
    @State var navigate:Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing:8){
            HStack{
                Text("Confiance en soi.")
                   // .font(.custom(FontManager.Verdana.regular, size: 22))
                    .bold()
                Spacer()
                Text("+ 14 pts") .padding(.horizontal,6).padding(.vertical,6)
                    //.font(.custom(FontManager.Verdana.regular, size: 14))
                    .bold()
                    .foregroundColor(.primary800)
                    .overlay(content: {
                        Capsule()   .stroke(lineWidth: 1).foregroundColor(.primary800)
                        
                    })
            }
            HStack{
                
                Text("Aujourd'hui")
                   // .font(.custom(FontManager.Verdana.regular, size: 16))
                    .bold()
                Text("8h40")
                    //.font(.custom(FontManager.Verdana.regular, size: 12))
                    .bold()
                    .foregroundColor(.neutral900)
            }
            HStack{
                Text("Je suis ici et maintenant, pleinement présent(e) dans l'instant présent.")
                    .lineSpacing(4)
                // .font(.custom(FontManager.Time_New_Roman.regular, size: 28))
              
                // Utiliser maxWidth: .infinity pour que le texte occupe toute la largeur
                    .foregroundColor(.primary600)
                Spacer(minLength: 36)
            }
            HStack {
                Text("@Maggie")
                    //.font(.custom(FontManager.Verdana.regular, size: 14))
                    .bold()
                    .italic()
                    .foregroundStyle(.neutral700)
                
            }
            Rectangle()
                .frame(height:200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack{
                Spacer()
                NavigationLink(isActive:$navigate) {
                    ProfileView()
                } label: {
                    VStack{
                        SparkleButton(buttonStates: $buttonStates, navigate: $navigate)

                    }
                    
                }
            }
        } .foregroundColor(.neutral900)
            .padding(16)
            .frame(width: 344, alignment: .leading)
            .background(.secondaryYellow100)
            .cornerRadius(6)
           //.shadow(color: .primary600, radius: 4, x: 0, y: 6)
            .overlay(
            RoundedRectangle(cornerRadius: 6)
            .inset(by: 1)
            .stroke(.primary800, lineWidth: 1))
        
    }
}

#Preview {
    FeedItemView()
}
