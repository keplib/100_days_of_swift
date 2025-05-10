//
//  ContentView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: FriendsAppVM
    
    @Query private var allUsers: [User]
    
    @Query(filter: #Predicate<User> { user in
        user.isActive == true
    }) private var activeUsers: [User]
    
    init(modelContext: ModelContext) {
        let viewModel = FriendsAppVM(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allUsers) { user in
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
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, Friend.self, configurations: config)
    let context = container.mainContext
    
    class PreviewViewModel: FriendsAppVM {
        override func loadUsers() async {
            // Do nothing - we'll manually insert sample data
        }
    }
    
    let previewVM = PreviewViewModel(modelContext: context)
    
    let friend1 = Friend(id: "eccdf4b8-c9f6-4eeb-8832-28027eb7015", name: "Gale Dyer")
    context.insert(friend1)
    
    let friend2 = Friend(id: "6c2d304e-43ba-4745-bdf0-acd70cda89a0", name: "Violet Fowler")
    context.insert(friend2)
    
    let user1 = User(
        id: "1",
        isActive: true,
        name: "Balazs Képlit",
        age: 41,
        company: "Bitpanda",
        email: "keplib@bitpanda.com",
        address: "30 Bessons 08818 Olivella",
        about: "Software developer",
        friends: [friend1, friend2],
        registered: Date()
    )
    
    context.insert(user1)
    
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
    
    context.insert(user2)

    let friendUser1 = User(
        id: "eccdf4b8-c9f6-4eeb-8832-28027eb7015",
        isActive: false,
        name: "Gale Dyer",
        age: 35,
        company: "Example Corp",
        email: "gale@example.com",
        address: "123 Sample St",
        about: "Friend of Balazs",
        friends: [],
        registered: Date()
    )
    
    context.insert(friendUser1)
    
    let friendUser2 = User(
        id: "6c2d304e-43ba-4745-bdf0-acd70cda89a0",
        isActive: true,
        name: "Violet Fowler",
        age: 28,
        company: "Test Inc",
        email: "violet@example.com",
        address: "456 Preview Ave",
        about: "Also a friend of Balazs",
        friends: [],
        registered: Date()
    )
    
    context.insert(friendUser2)
    
    do {
        try context.save()
    } catch {
        print("Failed to save preview context: \(error)")
    }
    
    return ContentView(modelContext: context)
        .modelContainer(container)
}




