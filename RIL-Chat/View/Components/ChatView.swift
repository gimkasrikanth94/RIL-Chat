//
//  ChatView.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 19/08/22.
//

import SwiftUI

struct ChatView: View {
    var currentMessage: Message
    @State var currentUser: User
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if (currentMessage.senderID != currentUser.id) {
                Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            } else {
                Spacer()
            }
            HStack{
                Text(currentMessage.message)
                    .font(.body)
                Text(currentMessage.date, formatter: timeFormatter)
                .font(.caption2)
            }
            .clipped()
                .padding(10)
                .foregroundColor((currentMessage.senderID == currentUser.id) ? Color.white : Color.black)
                .background((currentMessage.senderID == currentUser.id) ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                .cornerRadius(10)
            if (currentMessage.senderID != currentUser.id) {
                Spacer()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(currentMessage: Message(conversationId: "1", senderID: "234", senderName: "Srikanth", receiverID: "456", receiverName: "Harry", isRead: false, message: "Hello", date: Date()), currentUser: UserManager.shared.currentUser)
    }
}
