//
//  SortMenu.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 18/5/25.
//

import SwiftUI

struct SortMenu: View {
    
    @Binding var sortOrder: [SortDescriptor<User>]
    
    var body: some View {
        Menu("Sort", systemImage: "arrow.up.arrow.down") {
            Picker("Sort", selection: $sortOrder) {
                Text("Sort by Name")
                    .tag([
                        SortDescriptor(\User.name),
                        SortDescriptor(\User.registered)
                    ])
                
                Text("Sort by join date")
                    .tag([
                        SortDescriptor(\User.registered),
                        SortDescriptor(\User.name)
                    ])
            }
        }
    }
}

#Preview {
    SortMenu(sortOrder: .constant([
        SortDescriptor(\User.name),
        SortDescriptor(\User.registered)
    ]))
    .padding()
}
