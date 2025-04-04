//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Balázs Képli on 4/4/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
