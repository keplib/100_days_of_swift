//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Balázs Képli on 4/2/25.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct FormView: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                
            }
            Section {
                Button("Create accout") {
                    print("Creating account")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        VStack {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
                
                
        }
    }
    
    
    func loadData() async {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
