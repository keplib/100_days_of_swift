//
//  UserDetailView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import SwiftUI
import SwiftData

struct UserDetailView: View {
    
    var user: User
    @Environment(\.modelContext) var modelContext

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text(user.address)
            Text("Registered: \(dateFormatter.string(from: user.registered))")
                .font(.body)
            
            Section(header: Text("Friends")) {
                List {
                    ForEach(user.friends, id: \.self) { friend in
                        VStack {
                            NavigationLink(value: friend) {
                                Text(friend.name)
                            }
                        }
                    }
                }
                .navigationDestination(for: Friend.self) { friend in
                    // You need to find the corresponding User here
                    let descriptor = FetchDescriptor<User>(predicate: #Predicate { user in
                        user.id == friend.id
                    })
                    
                    if let user = try? modelContext.fetch(descriptor).first {
                        UserDetailView(user: user)
                    } else {
                        Text("User not found")
                    }
                }

            }
        }
    }
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "Balazs Képlit", age: 41, company: "Bitpanda", email: "keplib@bitpanda.com", address: "30 Bessons 08818 Olivella", about: "Software developer", friends: [
        Friend(id: "eccdf4b8-c9f6-4eeb-8832-28027eb7015", name: "Gale Dyer"),
        Friend(id: "6c2d304e-43ba-4745-bdf0-acd70cda89a0", name: "Violet Fowler")
    ], registered: Date()
                             ))
}
