//
//  EnumConditionalView.swift
//  18MapKitIntro
//
//  Created by Balázs Képli on 9/8/25.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success...")
    }
}

struct ErrorView: View {
    var body: some View {
        Text("Error...")
    }
}



struct EnumConditionalView: View {
    
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.success
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            ErrorView()
        }
    }
}

#Preview {
    EnumConditionalView()
}
