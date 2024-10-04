//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var userPoints = 0
    @State private var showAlert = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                
                ForEach(0..<3) {number in
                    Button(action: {
                       flagTapped(number)
                    }, label: {
                        Image(countries[number])
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 5.0)
                    })
                }
            }
        }
        .alert(scoreTitle, isPresented: $showAlert) {
            Button(action: {
                askQuestion()
            }, label: {
                Text("Continue")
            })
        } message: {
            Text("You have \(userPoints)")
        }

 
     
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userPoints += 1
            
        } else {
            scoreTitle = "Wrong"
        }
        
        showAlert = true
        
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
