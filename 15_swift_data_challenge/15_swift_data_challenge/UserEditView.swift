//
//  UserEditView.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 11/5/25.
//

import SwiftUI

struct UserEditView: View {
    
    @Bindable var user: User
    
    var body: some View {
        Form {
            Section(header: Text("Personal Info")) {
                TextField("Name", text: $user.name)
                                
                Toggle("Active", isOn: $user.isActive)
            }
            
            Section(header: Text("Contact")) {
                TextField("Email", text: $user.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Company", text: $user.company)
                
                TextField("Address", text: $user.address)
                    .lineLimit(3)
            }
            
            Section(header: Text("About")) {
                TextEditor(text: $user.about)
                    .frame(minHeight: 100)
            }
        }

    }
}

#Preview {
    UserEditView(user:  User(
        id: "1",
        isActive: true,
        name: "Balazs Képlit",
        age: 41,
        company: "Bitpanda",
        email: "keplib@bitpanda.com",
        address: "30 Bessons 08818 Olivella",
        about: "Software developer",
        friends: [],
        registered: Date()
    ))
}
