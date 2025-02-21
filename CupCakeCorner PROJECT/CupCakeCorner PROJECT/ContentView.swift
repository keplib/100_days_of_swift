//
//  ContentView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 6/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = OrderVM()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $viewModel.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(viewModel.order.quantity)", value: $viewModel.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $viewModel.order.specialRequestEnabled.animation())
                    
                    if viewModel.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $viewModel.order.extraFrosting)
                        Toggle("Add extra sprnkles", isOn: $viewModel.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery Details") {
                        AddressView(viewModel: viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
