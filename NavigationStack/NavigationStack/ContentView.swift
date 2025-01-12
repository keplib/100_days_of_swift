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
    
    @State private var path = [Int]()
    
    var body: some View {
//        NavigationStack {
//            
//            List(0..<100) { i in
//                NavigationLink {
//                    DetailView(number: i)
//                } label: {
//                    Text("Tap me")
//                }
//
//            }
//        }
        
        
//        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink(value: i) {
//                    Text("Select \(i)")
//                }
//                .navigationDestination(for: Int.self) { selection in
//                    DetailView(number: selection)
//                }
//            }
//        }
        
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                
                DetailView(number: selection)
            }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
