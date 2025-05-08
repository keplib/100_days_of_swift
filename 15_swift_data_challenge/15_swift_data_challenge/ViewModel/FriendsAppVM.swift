//
//  FriendsAppVM.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import Foundation
import SwiftData

@Observable
class FriendsAppVM {
    
    var users: [User] = []
    var errorMessage: String?
    var modelContext: ModelContext?

    
    init(modelContext: ModelContext? = nil){
        self.modelContext = modelContext
        Task {
            await loadUsers()
        }
        
    }
    
    @MainActor
    func loadUsers() async {
        if users.isEmpty {
            await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async {
        errorMessage = nil
        
        do {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                errorMessage = "Invalid URL"
                return
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUsers = try decoder.decode([User].self, from: data)
                
                if let modelContext = modelContext {
                    for user in decodedUsers {
                        for friend in user.friends {
                            modelContext.insert(friend)
                        }
                        
                        modelContext.insert(user)
                        users.append(user)
                    }
                }
                
            } catch {
                print("Decoding error: \(error)")
                errorMessage = "Failed to decode: \(error.localizedDescription)"
            }
            
        } catch {
            errorMessage = "Failed to fetch users: \(error.localizedDescription)"
        }
    }
}
