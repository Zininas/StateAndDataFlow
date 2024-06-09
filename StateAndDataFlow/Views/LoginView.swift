//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Александр Зинин on 28.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
    
    private func login() {
        userManager.user.isLoggedIn.toggle()
        storageManager.save(user: userManager.user)
    }
}

#Preview {
    LoginView()
        .environmentObject(UserManager())
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .font(.callout)
                    .foregroundStyle(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

