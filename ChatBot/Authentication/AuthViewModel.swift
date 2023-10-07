//
//  AuthViewModel.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 5.10.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var emailTextField: String = ""
    @Published var passwordTextField: String = ""
    
    @Published var isLoading = false
    @Published var isPasswordVisible = false
    @Published var doesUserExist = false
    
    let authService = AuthService()
    func authenticate(appState: AppState) {
        isLoading = true
        
        Task{
            do{
                if isPasswordVisible{
                    let result = try await authService.login(email: emailTextField, password: passwordTextField, userExists: doesUserExist)
                    await MainActor.run(body: {
                        guard let result = result else {return}
                        // Update App State
                        appState.currentUser = result.user
                    })
                } else {
                    doesUserExist = try await authService.checkUserExists(email: emailTextField)
                    isPasswordVisible = true
                }
                isLoading = false
            } catch {
                print(error)
                await MainActor.run{
                    isLoading = false
                    
                }
            }
        }
    }
}
