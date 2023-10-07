//
//  ProfileView.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 7.10.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var apiKey: String = UserDefaults.standard.string(forKey: "openai_api_key") ?? ""
    var body: some View {
        List {
            Section("OpenAI API KEY"){
                TextField("Enter key", text: $apiKey) {
                    UserDefaults.standard.set(apiKey, forKey: "openai_api_key")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
