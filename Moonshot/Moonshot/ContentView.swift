//
//  ContentView.swift
//  Moonshot
//
//  Created by Balázs Képli on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
