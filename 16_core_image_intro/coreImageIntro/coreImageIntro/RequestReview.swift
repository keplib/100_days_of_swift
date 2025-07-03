//
//  RequestReview.swift
//  coreImageIntro
//
//  Created by Balázs Képli on 3/7/25.
//

import SwiftUI
import StoreKit

struct RequestReview: View {
    
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReview()
}
