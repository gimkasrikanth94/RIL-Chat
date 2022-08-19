//
//  User.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation

class User: Codable{
    var id = UUID().uuidString
    var name = ""
    var image = ""
    var createdDate = ""
    
    init() {
        
    }
    
    init(id: String, name: String, image: String, createdDate: String){
        self.id = id
        self.name = name
        self.image = image
        self.createdDate = createdDate
    }
}
