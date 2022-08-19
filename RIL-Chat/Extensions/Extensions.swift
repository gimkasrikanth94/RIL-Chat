//
//  Extensions.swift
//  RIL-Chat
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation
import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.forEach({
            $0.endEditing(force)
        })
    }
    
}

public let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    return formatter
}()
