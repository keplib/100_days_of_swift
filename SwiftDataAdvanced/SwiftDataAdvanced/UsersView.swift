//
//  UsersView.swift
//  SwiftDataAdvanced
//
//  Created by Balázs Képli on 1/5/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]

    var body: some View {
        VStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Text(String(user.jobs.count))
                            .fontWeight(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            
            Spacer()
            
            Button("Add user with jobs") {
                addSample()
            }
        }
        
    }
    
    init(minimumJoinDate: Date, sortOder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> {user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOder)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize documents", priority: 4)
        let job2 = Job(name: "Meeting with Alex", priority: 3)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
