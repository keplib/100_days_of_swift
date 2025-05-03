//
//  AddressView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 7/2/25.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var viewModel: OrderVM
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.order.name)
                TextField("Street Address", text: $viewModel.order.streetAddress)
                TextField("City", text: $viewModel.order.city)
                TextField("ZIP", text: $viewModel.order.zip)
            }
            
            Section {
                NavigationLink("Checkout") {
                    CheckoutView(viewModel: viewModel)
                }
            }
            .disabled(!viewModel.order.hasValidAddress)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(viewModel: OrderVM())
}
