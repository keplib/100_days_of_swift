//
//  _5_swift_data_challengeApp.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import SwiftUI
import SwiftData

@main
struct _5_swift_data_challengeApp: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            container = try ModelContainer(for: User.self, Friend.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }

}
