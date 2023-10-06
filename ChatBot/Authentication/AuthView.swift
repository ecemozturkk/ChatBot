//
//  AuthView.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 5.10.2023.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            Text("Chat GPT iOS App")
                .font(.title)
                .bold()
            TextField("email", text: $viewModel.emailTextField)
                .modifier(CustomTextFieldStyle())
            if viewModel.isPasswordVisible {
                SecureField("Password", text: $viewModel.passwordTextField)
                    .modifier(CustomTextFieldStyle())
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button {
                    viewModel.authenticate(appState: appState)
                } label: {
                    Text(viewModel.isPasswordVisible ? "Create User" : "Login")
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
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

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.1))
            .textInputAutocapitalization(.never)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
