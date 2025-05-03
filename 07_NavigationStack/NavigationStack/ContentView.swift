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
        Text("You selected the number \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating DetailView \(number)")
    }
}

struct DetailTextView: View {
    
    var text: String
    
    var body: some View {
        Text("You selected the string \(text)")
    }
    
    init(text: String) {
        self.text = text
        print("Creating DetailTextView for \(text)")
    }
}

struct ContentView: View {
    
    //@State private var path = [Int]()
    @State private var path = NavigationPath()
    
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
        
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show 32") {
//                    path = [32]
//                }
//
//                Button("Show 64") {
//                    path.append(64)
//                }
//                
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                
//                DetailView(number: selection)
//            }
//        }
        
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
            .navigationDestination(for: String.self) { selection in
                DetailTextView(text: String(selection))
            }
        }
    }
}

#Preview {
    ContentView()
}
