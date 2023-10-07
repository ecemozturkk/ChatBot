//
//  ChatBotApp.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 5.10.2023.
//

import SwiftUI

@main
struct ChatBotApp: App {
    
    @ObservedObject var appState: AppState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                NavigationStack(path: $appState.navigationPath) {
                    ChatListView()
                        .environmentObject(appState)
                }
            } else {
                AuthView()
                    .environmentObject(appState)
            }
        }
    }
}
