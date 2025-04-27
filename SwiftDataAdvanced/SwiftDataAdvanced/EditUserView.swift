//
//  EditUserView.swift
//  SwiftDataAdvanced
//
//  Created by Balázs Képli on 27/4/25.
//

import SwiftUI

struct EditUserView: View {
    
    @State var user: User
    
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    EditUserView(user: User(name: "Balazs", city: "Barcelona", joinDate: .now))
}
