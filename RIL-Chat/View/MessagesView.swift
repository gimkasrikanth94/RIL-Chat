//
//  MessagesView.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct MessagesView: View {
    var messages: [Message] = [Message(conversationId: "0", senderID: "123", senderName: "Jack", receiverID: "234", receiverName: "Srikanth", isRead: false, message: "Hi", date: Date()), Message(conversationId: "1", senderID: "234", senderName: "Srikanth", receiverID: "456", receiverName: "Harry", isRead: false, message: "Hello", date: Date()), Message(conversationId: "2", senderID: "345", senderName: "John", receiverID: "234", receiverName: "Srikanth", isRead: true, message: "Hey!", date: Date())]


    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<messages.count, id: \.self) { index in
                        NavigationLink(destination: {
                            ConversationView(message: messages[index], messages: [messages[index]])
                        }) {
                            MessageView(message: messages[index])
                        }
                    }
                }

            }.navigationBarTitle("Messages")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func sendMessage() {
        
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
