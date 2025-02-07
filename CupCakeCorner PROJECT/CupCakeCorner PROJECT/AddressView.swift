//
//  AddressView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 7/2/25.
//

import SwiftUI

struct AddressView: View {
    
    var order: Order
    
    var body: some View {
        NavigationStack {
            NavigationLink("Checkout", destination: CheckoutView(order: order))
        }
    }
}

#Preview {
    AddressView(order: Order())
}
