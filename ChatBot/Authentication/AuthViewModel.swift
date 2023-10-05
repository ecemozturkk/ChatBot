//
//  AuthViewModel.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 5.10.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    func authenticate() {
        
    }
}
