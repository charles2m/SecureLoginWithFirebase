//
//  ProfileViewModel.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 25/06/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject{
    
    @Published var currentUser:User?
    
    init() {
        
        setupSubscriber()
        
        
    }
    
    private func setupSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
            print("DEBUG: user in view model from cobine is\(user)")
            
            
        }
        
    }
}
