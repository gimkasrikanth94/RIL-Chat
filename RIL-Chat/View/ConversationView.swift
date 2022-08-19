//
//  ConversationView.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct ConversationView: View {
    @State var message = Message()
    @State private var typingMessage: String = ""
    @State var messages: [Message] = []
    @ObservedObject private var keyboard = KeyboardManager()
    @State var currentUser = UserManager.shared.currentUser


    var body: some View {
        VStack {
//            CustomScrollView(axes: .vertical, scrollToEnd: true) {
            ScrollView {
                ForEach(0..<messages.count, id: \.self) { index in
                    ChatView(currentMessage: messages[index], currentUser: currentUser)
                }
            }
            HStack {
                TextField("Message...", text: $typingMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))

                Button(action: sendMessage) {
                    Text("Send")
                        .fontWeight((typingMessage != "") ? .bold : .regular)
                }
            }.frame(minHeight: CGFloat(50)).padding()
           
            
        }

        .navigationBarTitle(Text((currentUser.id == message.senderID) ? message.receiverName : message.senderName), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
            let id = (currentUser.id == message.senderID) ? message.receiverID : message.senderID
            let name = (currentUser.id == message.senderID) ? message.receiverName : message.senderName
            
            if currentUser.id == UserManager.shared.currentUser.id{

                currentUser = User(id: id, name: name, image: "", createdDate: "")
            }else{
                currentUser = UserManager.shared.currentUser
            }
 
            self.messages.forEach({
                let senderID = (currentUser.id == $0.senderID) ? $0.receiverID : currentUser.id
                let senderName = (currentUser.id == $0.senderID) ? $0.receiverName : currentUser.name
                let receiverID = (currentUser.id == $0.senderID) ? $0.senderID : currentUser.id
                let receiverName = (currentUser.id == $0.senderID) ? $0.senderName : currentUser.name
                $0.senderID = senderID
                $0.senderName = senderName
                $0.receiverID = receiverID
                $0.receiverName = receiverName
            })
        }) {
                Text("Switch User")
                    .bold()
//                Image(systemName: "fibrechannel")
            }

        )
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        .onTapGesture {
                self.endEditing(true)
        }

    }
    
    func sendMessage() {
        if typingMessage != ""{
            let id = (currentUser.id == message.senderID) ? message.receiverID : currentUser.id
            let name = (currentUser.id == message.senderID) ? message.receiverName : currentUser.name

            self.messages.append(Message(conversationId: message.conversationId, senderID: currentUser.id, senderName: currentUser.name, receiverID: id, receiverName: name, isRead: false, message: typingMessage, date: Date()))
            typingMessage = ""
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}




