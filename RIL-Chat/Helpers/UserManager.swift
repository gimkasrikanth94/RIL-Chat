//
//  UserManager.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation


class UserManager{
    static let shared = UserManager()
    
    var currentUser: User{
        return User(id: "234", name: "Srikanth", image: "", createdDate: "2019-08-18 04:00:00 PM")
    }
}
