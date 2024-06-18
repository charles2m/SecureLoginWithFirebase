//
//  AuthViewModel.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 18/06/2024.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthViewModel : ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
        
    }
    
    
    func signIn(withEmail email: String, password:String) async throws {
        
        
        
        
        
    }
    
    
    func createUser(withEmail email:String, password: String, fullname:String ) async throws {
        
        
    }
    
    func signOut() {
        
        
        
    }
}
