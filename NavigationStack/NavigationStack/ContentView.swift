//
//  ContentView.swift
//  NavigationStack
//
//  Created by Balázs Képli on 12/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                Text("Tap me")
            }

        }
    }
}

#Preview {
    ContentView()
}
