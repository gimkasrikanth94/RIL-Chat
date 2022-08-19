//
//  MessageView.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct MessageView: View {
    @State var message: Message?
    var body: some View {
        if let msg = self.message{
            HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(msg.senderName)
                    .font(.body)
                    .fontWeight((!msg.isRead && msg.senderID != UserManager.shared.currentUser.id) ? .bold : .regular)
                Text(msg.message)
                    .font(.subheadline)
                    .fontWeight((!msg.isRead && msg.senderID != UserManager.shared.currentUser.id) ? .bold : .regular)
                HStack{
                    Spacer()
                    Text(msg.date, formatter: timeFormatter)
                    .font(.caption)
                    .fontWeight((!msg.isRead && msg.senderID != UserManager.shared.currentUser.id) ? .bold : .regular)
                }
            }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

