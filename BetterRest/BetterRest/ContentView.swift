//
//  ContentView.swift
//  BetterRest
//
//  Created by Balázs Képli on 8/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var stepperValue: Double = 0.0
    
    var body: some View {
        VStack {
            Stepper(value: $stepperValue, in: 4...12, step: 0.25) {
                Text("\(stepperValue.formatted()) hours")
            }
            Text("\(stepperValue.formatted())")
           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
