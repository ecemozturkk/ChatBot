//
//  AuthView.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 5.10.2023.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel : AuthViewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
            Text("AI Travel Pal")
                .font(.title)
                .bold()
            TextField("Email", text: $viewModel.emailTextField)
                .padding()
                .background(Color.gray.opacity(0.1))
                .textInputAutocapitalization(.never)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            if viewModel.isPasswordVisible {
                SecureField("Password", text: $viewModel.passwordTextField)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .textInputAutocapitalization(.never)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            if viewModel.isLoading{
                ProgressView()
            } else {
                
                Button{
                    viewModel.authenticate(appState: appState)
                }label: {
                    Text(viewModel.doesUserExist ? "Log In" : "Create User")
                }
                .padding()
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
            
        }
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
