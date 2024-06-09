//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Александр Зинин on 28.05.2024.
//

import Foundation

final class UserManager: ObservableObject {
   
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init(user: User = User()) {
        self.user = user
    }
}
