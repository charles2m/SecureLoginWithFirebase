//
//  MainTabView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 23/06/2024.
//

import SwiftUI

struct MainTabView: View {
    @State var selected:Int = 0
    var body: some View {
        
        TabView(selection:$selected){
            FeedView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("Explorer")
                }
                .onAppear(perform: {
                    selected = 0
                })
                .tag(0)
            
            SelectionView()
                .tabItem {
                    Image(systemName:selected == 1 ? "plus.rectangle.fill" : "plus.rectangle")
                        .environment(\.symbolVariants, selected == 1 ? .fill : .none)
                    
                    Text("Créer")
                }
                .onAppear(perform: {
                    selected = 1
                })
                .tag(1)
            ExploreView()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Classement")
                }
                .onAppear(perform: {
                    selected = 2
                })
                .tag(2)
        }
        .accentColor(.primary800)
    }
}

#Preview {
    MainTabView()
}
