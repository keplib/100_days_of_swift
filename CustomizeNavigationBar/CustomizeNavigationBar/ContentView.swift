//
//  ContentView.swift
//  CustomizeNavigationBar
//
//  Created by Balázs Képli on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) {i in
                NavigationLink(value: i) {
                    Text("Row \(i)")
                        .navigationDestination(for: Int.self) { number in
                            Text("DetailView \(number)")
                    }
                }
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Tap me") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
