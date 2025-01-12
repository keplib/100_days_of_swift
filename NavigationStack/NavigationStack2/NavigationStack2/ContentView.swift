//
//  ContentView.swift
//  NavigationStack2
//
//  Created by Balázs Képli on 12/1/25.
//

import SwiftUI


// SOLUTION 1: saving path in an observable class

//@Observable
//class PathStore {
//    var path = NavigationPath()
//        
//    func goHome() {
//        path = NavigationPath()
//    }
//}
//
//struct DetailView: View {
//    
//    var number: Int
//    var path: NavigationPath
//    var vm: PathStore
//    
//    var body: some View {
//        NavigationLink("Go to random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                    vm.goHome()
//                }
//            }
//    }
//        
//}
//
//struct ContentView: View {
//    
//    @State private var path = [Int]()
//    @State private var vm = PathStore()
//    
//    var body: some View {
//        NavigationStack(path: $vm.path) {
//            DetailView(number: 0, path: vm.path, vm: vm)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: vm.path, vm: vm)
//                }
//        }
//    }
//}


// SOLUTION 2: using binding

struct DetailView: View {
    
    var number: Int
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}



#Preview {
    ContentView()
}
