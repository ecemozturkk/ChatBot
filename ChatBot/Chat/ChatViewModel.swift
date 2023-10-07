//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 7.10.2023.
//

import Foundation
import OpenAI

class ChatViewModel: ObservableObject {
    @Published var chat: AppChat?
    @Published var messages: [AppMessage] = []
    @Published var messageText: String = ""
    @Published var selectedModel: ChatModel = .gpt3_5_turbo
    let chatID: String
    
    init (chatID: String) {
        self.chatID = chatID
    }
    
    func fetchData() {
        self.messages = [AppMessage(id: "1", text: "Hello hi", role: .user, createdAt: Date()),
        AppMessage(id: "2", text: "Hellooooo", role: .assistant, createdAt: Date())]
    }
    
    func sendMessage() {
        var newMessage = AppMessage(id: UUID().uuidString, text: messageText, role: .user, createdAt: Date())
        messages.append(newMessage)
        messageText = ""
    }
}

struct AppMessage: Identifiable, Codable, Hashable {
    let id: String?
    var text: String
    let role: Chat.Role
    let createdAt: Date
}
