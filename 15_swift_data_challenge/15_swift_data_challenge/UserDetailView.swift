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
    @State private var isEditingUser = false
    @Environment(\.modelContext) var modelContext
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Group {
                    Text(user.name)
                        .font(.title)
                        .bold()
                    HStack {
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundStyle(user.isActive ? Color.green : Color.red)
                            .font(.subheadline)
                        Spacer()
                        Text("Age: \(user.age)")
                            .font(.subheadline)
                    }
                    
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    
                    Text("Registered: \(dateFormatter.string(from: user.registered))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("About")
                        .font(.headline)
                        .padding(.top, 8)
                    Text(user.about)
                        .padding(.bottom, 8)
                    
                    if !user.friends.isEmpty {
                        Divider()
                        
                        Text("Friends")
                            .font(.headline)
                            .padding(.top)
                        
                        ForEach(user.friends) { friend in
                            NavigationLink(value: friend) {
                                Text(friend.name)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("UserDetails")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isEditingUser = true
                    }) {
                        Label("Edit", systemImage: "pencil")
                    }
                }
            }
            .sheet(isPresented: $isEditingUser) {
                NavigationStack {
                    UserEditView(user: user)
                        .navigationTitle("Edit USer")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    modelContext.rollback()
                                    isEditingUser = false
                                }
                            }
                            
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    try? modelContext.save()
                                    isEditingUser = false
                                }
                            }
                        }
                }
                .presentationDetents([.large])
                
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
