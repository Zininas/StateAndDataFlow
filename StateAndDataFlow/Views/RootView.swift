//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Александр Зинин on 28.05.2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager)
    }
}

#Preview {
    RootView()
        .environmentObject(UserManager())
}
