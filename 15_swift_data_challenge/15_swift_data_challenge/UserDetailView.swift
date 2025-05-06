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
        Text(user.address)
    }
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "Balazs Képlit", age: 41, company: "Bitpanda", email: "keplib@bitpanda.com", address: "30 Bessons 08818 Olivella", about: "Software developer"))
}
