//
//  MissionCardView.swift
//  Moonshot
//
//  Created by Balázs Képli on 12/12/24.
//

import SwiftUI

struct MissionCardView: View {
    
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(Color.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

#Preview {
    
    MissionCardView(mission: Mission.samples[0])
}

