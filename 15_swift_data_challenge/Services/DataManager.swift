//
//  DataManager.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 18/5/25.
//

import SwiftData
import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    // Check if users exist in the database
    func hasExistingUsers(in context: ModelContext) -> Bool {
        let descriptor = FetchDescriptor<User>()
        
        do {
            let existingUsers = try context.fetch(descriptor)
            return !existingUsers.isEmpty
        } catch {
            print("Error checking for existing users: \(error)")
            return false
        }
    }
    
    // Save users to the database
    func saveUsers(_ users: [User], in context: ModelContext) {
        for user in users {
            for friend in user.friends {
                context.insert(friend)
            }
            context.insert(user)
        }
    }
    
    // Fetch all users
    func fetchUsers(in context: ModelContext) -> [User] {
        let descriptor = FetchDescriptor<User>()
        
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Error fetching users: \(error)")
            return []
        }
    }
    
    // Fetch active users only
    func fetchActiveUsers(in context: ModelContext) -> [User] {
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate<User> { user in
                user.isActive == true
            }
        )
        
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Error fetching active users: \(error)")
            return []
        }
    }
    
    // Find a user by ID
    func findUser(withID id: String, in context: ModelContext) -> User? {
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate<User> { user in
                user.id == id
            }
        )
        
        do {
            return try context.fetch(descriptor).first
        } catch {
            print("Error finding user: \(error)")
            return nil
        }
    }
}
