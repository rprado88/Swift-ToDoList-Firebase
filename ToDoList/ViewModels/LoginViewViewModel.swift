//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Rodrigo Prado on 22/04/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        // Try to log in on Firebase
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
    
        errorMessage = ""
        print("Validate -> start")
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            print("Validate -> false (empty fields)")
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".")
        else{
            print("Validate -> false (email invalid)")
            errorMessage = "Email invalid"
            return false
        }
        
        print("Validate -> End")
        return true
    }
}
