//
//  ChatView.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 7.10.2023.
//

import SwiftUI

struct ChatView: View {
    var viewModel: ChatViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: .init(chatID: ""))
    }
}
