//
//  ContentView.swift
//  SaveNavigationPath
//
//  Created by Balázs Képli on 3/2/25.
//

import SwiftUI


// FOR SIMPLE DATA TYPES

//@Observable
//class PathStore {
//    var path: [Int] {
//        didSet {
//           save()
//        }
//    }
//    
//    private let savePath = URL.documentsDirectory.appending(path: "SavePath")
//    
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
//                path = decoded
//                return
//            }
//        }
//        path = []
//    }
//    
//    func save() {
//        do {
//            let data = try JSONEncoder().encode(path)
//            try data.write(to: savePath)
//        } catch {
//            print("Failed to save data")
//        }
//    }
//}


// FOR COMPLEX DATA TYPES

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
           save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavePath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }

    func save() {
        
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save data")
        }
    }
}

struct DetailView: View {
    
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct ContentView: View {
    
    @State private var pathStore: PathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) {i in
                    DetailView(number: i)
                }
        }
    }
}

#Preview {
    ContentView()
}
