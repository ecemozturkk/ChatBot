//
//  ChatListView.swift
//  ChatBot
//
//  Created by Ecem Öztürk on 7.10.2023.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    var body: some View {
        Group {
            switch viewModel.loadingState {
            case .loading, .none:
                Text("Loading chats")
            case .noResults:
                Text("No chats")
            case .resultFound:
                List {
                    ForEach(viewModel.chats) { chat in
                        NavigationLink(value: chat.id) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(chat.topic ?? "New Chat")
                                        .font(.headline)
                                    Spacer()
                                    Text(chat.model?.rawValue ?? "")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(chat.model?.tintColor ?? .white)
                                        .padding(6)
                                        .background((chat.model?.tintColor ?? .white).opacity(0.1))
                                        .clipShape(Capsule(style: .continuous))
                                }
                                Text(chat.lastMessageTimeAgo)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteChat(chat: chat)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }

                        }
                    }
                }
            }
        }
        .navigationTitle("Chats")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.showProfile()
                } label: {
                    Image(systemName: "person")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.createChat()
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        })
        .sheet(isPresented: $viewModel.isShowingProfileView) {
            ProfileView()
        }
        .navigationDestination(for: String.self, destination: { chatID in
            ChatView(viewModel: .init(chatID: chatID))
        })
        .onAppear {
            if viewModel.loadingState == .none {
                viewModel.fetchData()
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
