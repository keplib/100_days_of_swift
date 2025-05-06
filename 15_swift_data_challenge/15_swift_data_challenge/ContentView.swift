//
//  ContentView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel: FriendsAppVM = FriendsAppVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        Text(user.name)
                    }
                    
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView()
            }
        }
    }
}

#Preview {
    ContentView()
}
