//
//  ContentView.swift
//  IntroNAvigationStack
//
//  Created by Balázs Képli on 6/1/25.
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
