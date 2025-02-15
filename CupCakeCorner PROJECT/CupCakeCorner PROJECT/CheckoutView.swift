//
//  CheckoutView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 7/2/25.
//

import SwiftUI

struct CheckoutView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale:3) { image in
                    image
                        .resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place order") {
                    Task {
                        await order.placeOrder(for: order)
                    }
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $order.showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(order.confirmationMessage)
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
