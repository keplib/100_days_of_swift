//
//  UserRowView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 18/5/25.
//

import SwiftUI

struct UserRowView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            Text(user.name)
            Spacer()
            Circle()
                .fill(user.isActive ? .green : .red)
                .frame(width: 10, height: 10)
        }
    }
}

#Preview {
    UserRowView(user: User(id: "2", isActive: true, name: "Test User", age: 23, company: "Vercel", email: "test@vercel.com", address: "123 Test Avenue", about: "this is just for testing purposes", friends: [], registered: .now))
}
