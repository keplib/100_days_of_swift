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
    
    var errorMessage: String?
    var modelContext: ModelContext
    
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
            Task {
                await loadUsers()
            }
        
    }
    
    @MainActor
    func loadUsers() async {
        
        if DataManager.shared.hasExistingUsers(in: modelContext) {
                   return
               }
        
        do {
            let users = try await APIManager.shared.fetchUsers()
            DataManager.shared.saveUsers(users, in: modelContext)
        } catch APIManager.APIError.invalidURL {
            errorMessage = "Invalid URL"
        } catch {
            errorMessage = "Failed to fetch users: \(error.localizedDescription)"
        }
        
        let descriptor = FetchDescriptor<User>()
        
    }
    
    func findUserForFriend(_ friend: Friend) -> User? {
        return DataManager.shared.findUser(withID: friend.id, in: modelContext)
    }
}
