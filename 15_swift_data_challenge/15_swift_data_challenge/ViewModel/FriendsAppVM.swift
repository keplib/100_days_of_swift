//
//  FriendsAppVM.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import Foundation

@Observable
class FriendsAppVM {
    
    var users: [User] = []
    
    init(){
        self.users =  fetchUsers()
    }
    
    private func fetchUsers() -> [User] {
        print("Fetching users...")
        
        return [
            User(id: "1", isActive: true, name: "Balazs Képlit", age: "41", company: "Bitpanda", email: "keplib@bitpanda.com", address: "30 Bessons 08818 Olivella", about: "Software developer"),
            User(id: "2", isActive: false, name: "Teszt Elek", age: "54", company: "wefox", email: "teszt.elek@wefox.hu", address: "7 Erkel Ferenc utca 123", about: "devOps engineer")
        ]
    }
}
