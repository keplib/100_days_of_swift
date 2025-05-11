//
//  UsersListView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 11/5/25.
//

import SwiftUI
import SwiftData

struct UsersListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
        
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
    
    init(showActiveOnly: Bool = false, sortOrder: [SortDescriptor<User>]) {
        if showActiveOnly {
            _users = Query(filter: #Predicate<User> { user in
                user.isActive == true
            }, sort: sortOrder)
        } else {
            _users = Query(sort: sortOrder)
        }
    }

    

}

#Preview {
    
    UsersListView(showActiveOnly: true, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
        
}

