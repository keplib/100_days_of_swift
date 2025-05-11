//
//  UsersListView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 11/5/25.
//

import SwiftUI
import SwiftData

struct UsersListView: View {
    
    var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 10, height: 10)
                    }
                }
                
            }
        }
    }
    

}

#Preview {
    
    let user1 = User(
        id: "1",
        isActive: true,
        name: "Balazs Képlit",
        age: 41,
        company: "Bitpanda",
        email: "keplib@bitpanda.com",
        address: "30 Bessons 08818 Olivella",
        about: "Software developer",
        friends: [],
        registered: Date()
    )
    
    
    let user2 = User(
        id: "2",
        isActive: false,
        name: "John Doe",
        age: 35,
        company: "Example Corp",
        email: "john@example.com",
        address: "123 Test Street",
        about: "Sample user for preview",
        friends: [],
        registered: Date().addingTimeInterval(-86400 * 30)
    )
    
    
    UsersListView(users: [user1, user2])
        
}

