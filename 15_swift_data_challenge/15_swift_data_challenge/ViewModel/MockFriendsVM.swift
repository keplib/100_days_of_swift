//
//  MockFriendsVM.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 10/5/25.
//

import Foundation
import SwiftData

@Observable
class MockFriendsAppVM: FriendsAppVM {
    init(modelContext: ModelContext, preloadedUsers: [User]) {
        super.init(modelContext: modelContext)
                self.users = preloadedUsers
    }
    
    @MainActor
    override func loadUsers() async {
    }
}

