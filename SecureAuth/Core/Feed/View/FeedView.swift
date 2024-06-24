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
                    header
                    ScrollView(showsIndicators:false) {
                        
                        LazyVStack(spacing:20){
                            ForEach(0...10,id:\.self) { tweet in
                                FeedItemView()
                                
                            }
                            
                        }
                        .padding()
                        
                        
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
    
    var header: some View {
        ZStack{
            
            HStack{
                VStack(alignment:.leading){
                    Text ("Moments")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .font(.title)
                    Text ("Connectez-vous avec d'autres entrepreneurs")
                        .font(.caption)
                    
                }
                
                Image(systemName: "person.circle")
                    .font(.title)
                    .onTapGesture {
                        
                    }
            }
            .padding()

        }.background(Color.secondaryYellow200)
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
