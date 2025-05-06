//
//  User.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import Foundation
import SwiftData


class User: Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: String
    var company: String
    var email: String
    var address: String
    var about: String
    
    init(id: String, isActive: Bool, name: String, age: String, company: String, email: String, address: String, about: String) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
    }
    
}
