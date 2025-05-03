//
//  Order.swift
//  CupCakeCorner PROJECT
//
//  Created by Balázs Képli on 6/2/25.
//

import Foundation

@Observable
class OrderVM {
    
    var order = Order()
    
    var confirmationMessage: String = ""
    var showingConfirmation: Bool = false
    
    func placeOrder(for order: Order) async {
        
        // Encode order into a JSON
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // Create url and create a request
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        
        //Filling the request specs
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            print(data)
            
            
            // handle the result, confirm that resposne is equal to request json
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way!"
            showingConfirmation = true
        } catch {
            print("Check out failed: \(error.localizedDescription)")
        }
    }
}
