//
//  Message.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation


class Message: Codable{
    var conversationId = UUID().uuidString
    var senderID = ""
    var senderName = ""
    var receiverID = ""
    var receiverName = ""
    var isRead = false
    var message = ""
    var date = Date()

    init() {
        
    }
    
    init(conversationId: String, senderID: String, senderName: String, receiverID: String, receiverName: String, isRead: Bool, message: String, date: Date){
        self.conversationId = conversationId
        self.senderID = senderID
        self.senderName = senderName
        self.receiverID = receiverID
        self.receiverName = receiverName
        self.isRead = isRead
        self.message = message
        self.date = date
    }
}
