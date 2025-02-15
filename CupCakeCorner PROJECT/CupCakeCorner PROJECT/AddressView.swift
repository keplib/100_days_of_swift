//
//  AddressView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 7/2/25.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("ZIP", text: $order.zip)
                }
                
                Section {
                    NavigationLink("Checkout", destination: CheckoutView(order: order))
                }
                .disabled(!order.hasValidAddress)
            }
            .navigationTitle("Delivery Details")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    AddressView(order: Order())
}
