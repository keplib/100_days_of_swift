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
                        HStack {
                            Text(user.name)
                            Spacer()
                            Circle()
                                .fill(user.isActive ? .green : .red)
                                .frame(width: 10, height: 10)
                        }
                    }
                    
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
        }
    }
}

#Preview {
    ContentView()
}
