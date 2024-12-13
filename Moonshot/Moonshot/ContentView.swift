//
//  ContentView.swift
//  Moonshot
//
//  Created by Balázs Képli on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vm = MoonshotVM()
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.missions) { mission in
                        NavigationLink(value: mission) {
                            MissionCardView(mission: mission)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, viewModel: vm)
            }
        }
    }
}

#Preview {
    ContentView()
}
