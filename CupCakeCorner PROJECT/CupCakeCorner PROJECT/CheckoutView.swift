//
//  CheckoutView.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 7/2/25.
//

import SwiftUI

struct CheckoutView: View {
    
    @Bindable var viewModel: OrderVM
    
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
                Text("Your total cost is \(viewModel.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place order") {
                    Task {
                        await viewModel.placeOrder(for: viewModel.order)
                    }
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $viewModel.showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(viewModel.confirmationMessage)
        }
    }
}

#Preview {
    CheckoutView(viewModel: OrderVM())
}
