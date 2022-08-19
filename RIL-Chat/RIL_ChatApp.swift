//
//  RIL_ChatApp.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

@main
struct RIL_ChatApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MessagesView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
