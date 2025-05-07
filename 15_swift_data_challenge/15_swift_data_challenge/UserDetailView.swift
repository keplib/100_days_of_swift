//
//  UserDetailView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            Text(user.address)
            
            Section(header: Text("Friends")) {
                List {
                    ForEach(user.friends, id: \.self) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
    }
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "Balazs Képlit", age: 41, company: "Bitpanda", email: "keplib@bitpanda.com", address: "30 Bessons 08818 Olivella", about: "Software developer", friends: [
        Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")
    ]))
}
