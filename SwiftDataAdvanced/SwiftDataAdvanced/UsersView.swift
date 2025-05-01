//
//  UsersView.swift
//  SwiftDataAdvanced
//
//  Created by Balázs Képli on 1/5/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                Text(user.name)
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> {user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
