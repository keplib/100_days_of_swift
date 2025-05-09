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
    
    init(viewModel: FriendsAppVM? = nil) {
        if let viewModel = viewModel {
            self.viewModel = viewModel
        } else {
            self.viewModel = FriendsAppVM()
        }

    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
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
            .onAppear {
                if viewModel.modelContext == nil {
                    viewModel.modelContext = modelContext
                }
            }
        }
    }
}

#Preview {
    
    
    
    let container = try! ModelContainer(for: User.self, Friend.self,
                                      configurations: ModelConfiguration(isStoredInMemoryOnly: true))
       
       // Create a view that handles setup on appear
       ContentView()
           .modelContainer(container)
           .onAppear {
               // Set up preview data here
               let context = container.mainContext
               
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
                           
                           // Add user objects for friends with matching IDs
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
                           
                           
           }
}
