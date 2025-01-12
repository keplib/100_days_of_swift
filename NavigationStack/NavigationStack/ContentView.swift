//
//  ContentView.swift
//  NavigationStack
//
//  Created by Balázs Képli on 12/1/25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating DetailView \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            List(0..<10) { i in
                NavigationLink {
                    DetailView(number: i)
                } label: {
                    Text("Tap me")
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
