//
//  ContentView.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
