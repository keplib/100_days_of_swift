//
//  ContentView.swift
//  Moonshot
//
//  Created by Balázs Képli on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text(String(astronauts.count))
            Text(String(missions.count))
        }
    }
}

#Preview {
    ContentView()
}
