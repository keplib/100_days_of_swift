//
//  FriendsAppVM.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import Foundation

@Observable
class FriendsAppVM {
    
    var users: [User] = []
    var errorMessage: String?
    
    init(){
        Task {
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
                let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                self.users = decodedUsers
            } catch {
                print("Decoding error: \(error)")
                errorMessage = "Failed to decode: \(error.localizedDescription)"
            }
            
        } catch {
            errorMessage = "Failed to fetch users: \(error.localizedDescription)"
        }
    }
}
