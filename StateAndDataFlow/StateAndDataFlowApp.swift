//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Александр Зинин on 28.05.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager(
        user: StorageManager.shared.fetchUser()
        )
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userManager)
        }
    }
}
