//
//  EditUserView.swift
//  SwiftDataAdvanced
//
//  Created by Balázs Képli on 27/4/25.
//

import SwiftUI

struct EditUserView: View {
    
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditUserView(user: User(name: "Balazs", city: "Barcelona", joinDate: .now))
}
