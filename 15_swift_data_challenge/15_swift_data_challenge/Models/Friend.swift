//
//  Friend.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 6/5/25.
//

import Foundation
import SwiftData

class Friend: Decodable, Identifiable, Hashable {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
}
