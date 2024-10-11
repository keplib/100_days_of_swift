//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                    Text(vm.flags[vm.correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                
                ForEach(0..<3) {number in
                    Button(action: {
                        vm.clickFlag(number)
                    }, label: {
                        Image(vm.flags[number])
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 5.0)
                    })
                }
            }
        }
        .alert(vm.popupHeader, isPresented: $vm.showAlert) {
            Button(action: {
                vm.getQuestion()
            }, label: {
                Text("Continue")
            })
        } message: {
            Text("You have \(vm.userScore)")
        }

 
     
    }
}

#Preview {
    ContentView(vm: ViewModel())
}
