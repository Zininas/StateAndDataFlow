//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Александр Зинин on 28.05.2024.
//

import SwiftUI

struct ContentView: View {
  
    @EnvironmentObject private var userManager: UserManager
    
    private let timer = TimeCounter()
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()
            
                ButtonView(title: "LogOut", color: .blue) {
                    storageManager.clear(userManager: userManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}
