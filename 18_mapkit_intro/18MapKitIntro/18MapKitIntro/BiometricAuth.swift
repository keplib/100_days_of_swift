//
//  BiometricAuth.swift
//  18MapKitIntro
//
//  Created by Balázs Képli on 10/8/25.
//

import SwiftUI
import LocalAuthentication

struct BiometricAuth: View {
    
    @State private var isUnlocked: Bool = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }

            }
        } else {
            // no biometrics
        }
    }
}


#Preview {
    BiometricAuth()
}
