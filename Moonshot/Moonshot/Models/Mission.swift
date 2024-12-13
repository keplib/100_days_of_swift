//
//  Mission.swift
//  Moonshot
//
//  Created by Balázs Képli on 7/12/24.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    
    struct Crew: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

extension Mission {
    static let samples = [
        Mission(id: 1, launchDate: Date(), crew: [Crew(name: "Teszt Elek", role: "Captain")], description: "First moon landing mission."),
    ]
}
