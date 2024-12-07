//
//  Mission.swift
//  Moonshot
//
//  Created by Balázs Képli on 7/12/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [Crew]
    let description: String
}

struct Crew: Codable {
    let name: String
    let role: String
}
