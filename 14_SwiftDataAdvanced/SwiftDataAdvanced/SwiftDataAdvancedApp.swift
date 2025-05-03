//
//  SwiftDataAdvancedApp.swift
//  SwiftDataAdvanced
//
//  Created by Balázs Képli on 27/4/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataAdvancedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
