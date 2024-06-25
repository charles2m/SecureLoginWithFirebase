//
//  AuthViewModel.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 18/06/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}


@MainActor
class AuthViewModel : ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var errString: String?
        @Published var successMessage: String?
    
    init() {
        
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser ()
        }
    }
    
    
    func signIn(withEmail email: String, password:String) async throws {
        
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch {
            print("Failed login • \(error.localizedDescription)")
        }
        
        
    }
    
    func forgotPassword(for email: String) {
           Auth.auth().sendPasswordReset(withEmail: email) { error in
               if let error = error {
                   self.errString = error.localizedDescription
                   self.successMessage = nil
               } else {
                   self.successMessage = "Un e-mail de réinitialisation de mot de passe a été envoyé."
                   self.errString = nil
               }
           }
       }
   
    
    
    func createUser(withEmail email:String, password: String, fullname:String ) async throws {
        
        do {
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            
        } catch {
            
            print("DEBUG fail to create use with descrption : \(error.localizedDescription)")
            
        }
        
    }
    
    func signOut() {
        
        do {
            
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch{
            print("DEBUG falied log out")
        }
        
    }
    
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as:User.self)
        
        print("DEBUG:current user is \(self.currentUser)")
    }
}
