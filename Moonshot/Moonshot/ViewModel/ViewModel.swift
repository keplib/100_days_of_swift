//
//  ViewModel.swift
//  Moonshot
//
//  Created by Balázs Képli on 13/12/24.
//

import Foundation

@Observable
class MoonshotVM {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    func getCrewForMission(for mission: Mission) -> [CrewMember] {
        mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
        
    }
    
    // MARK TODO: either calculate crewForMission here as a calculated property or do something with didSet to keep track of the actual mission
    
    
    
//    var crewForMission: [Mission: [CrewMember]] {
//           Dictionary(uniqueKeysWithValues: missions.map { mission in
//               let crew = mission.crew.map { member in
//                   if let astronaut = astronauts[member.name] {
//                       return CrewMember(role: member.role, astronaut: astronaut)
//                   } else {
//                       fatalError("Missing \(member.name)")
//                   }
//               }
//               return (mission, crew)
//           })
//       }
}
