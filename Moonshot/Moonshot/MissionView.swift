//
//  MissionView.swift
//  Moonshot
//
//  Created by Balázs Képli on 12/12/24.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    var viewModel: MoonshotVM
    let crew: [CrewMember]
    
    init(mission: Mission, viewModel: MoonshotVM) {
        self.mission = mission
        self.viewModel = viewModel
        
        self.crew = viewModel.getCrewForMission(for: mission)
    }
    

    
    var body: some View {
        ScrollView {
            VStack() {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
               
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink(value: crewMember) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                            }
                            
                            
                        }
                    }
                    .padding()
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .navigationDestination(for: CrewMember.self) { crewMember in
            AstronautView(astronaut: crewMember.astronaut)
        }
    }
    

}

#Preview {
   let missions: [Mission] = Bundle.main.decode("missions.json")
   return MissionView(mission: missions[0], viewModel: MoonshotVM())
        .preferredColorScheme(.dark)
}
