//
//  FeedView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct FeedView: View {
    @State var isHide = false
    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.top) {
                Color.secondaryYellow200.edgesIgnoringSafeArea(.all)
                
                VStack{
                    //header
                    ScrollView(showsIndicators:false) {
                        
                        LazyVStack(spacing:20){
                          
                            scrollTracker
                            ForEach(0...10,id:\.self) { tweet in
                                FeedItemView()
                                
                            }
                            
                        }
                        .padding()
                        
                        
                    }
                    .safeAreaInset(edge: .top) {
                       Color.clear
                           .frame(height:44)
                         
                   }
                    .overlay {
                        header(isScroll: isHide)
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    FeedView()
}



extension FeedView {
    
    func header(isScroll:Bool) -> some View {
        ZStack(alignment:.top){
            Color.clear
                .frame(height: isScroll ? 52 : 40)
             .background( .secondaryYellow200)
                .opacity(isScroll ? 1 : 0)
                .blur(radius:0.5)
                .edgesIgnoringSafeArea(.top)
            
            HStack{
                VStack(alignment:.leading,spacing:4){
                    Text ("Moments")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .font(.title)
               
                    HStack(spacing:0){
                        Spacer()
                                NavigationLink {
                                    ProfileView()
                                } label: {
                                    Image(systemName: "person")
                                    Image(systemName: "chevron.right")
                                    
                                }
                                .font(.title2)
                            }
                    Text ("Connectez-vous avec d'autres entrepreneurs")
                        .font(.caption)
                    
                }
                .opacity(isScroll ? 0 : 1 )
                
             
            }
            
                       .foregroundColor(isScroll ? .primary800 : .primary800)
                      .offset(y: isScroll ? -30 : -0)
                      .padding(.horizontal,20)
         

        }
        
        //.background(Color.secondaryYellow200)
        
            .frame(maxHeight: .infinity, alignment: .top)
    }
        
}
extension FeedView {
    
    var scrollTracker: some View {
        
        GeometryReader { reader -> AnyView in
            
            let yAxis = reader.frame(in: .global).minY
            print(yAxis)
            if yAxis < 0 && !isHide {
                DispatchQueue.main.async {
                    withAnimation {isHide = true}
                    
                    
                }
            }
            if yAxis > 0 && isHide {
                DispatchQueue.main.async {
                    withAnimation {
                        isHide = false
                    }
                    
                }
            }
            return  AnyView(Text("")
                .frame(width:0, height:0))
        }
    }
}
