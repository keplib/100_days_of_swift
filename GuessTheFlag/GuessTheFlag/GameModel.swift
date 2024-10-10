//
//  GameModel.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 10/10/24.
//

import Foundation


struct GameModel<FlagContent> {
    
    var flags: Array<FlagContent>
    var userPoints: Int
    var correctAnswer: Int
    var usersChoice: Int
    
    init(countryNames: Array<FlagContent>) {
        flags = countryNames
        userPoints = 0
        correctAnswer = Int.random(in: 0...2)
        usersChoice = 0
    }
    
    mutating func askQuestion () {
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    mutating func flagTapped (_ choice: Int) -> Bool {
        usersChoice = choice
        
        if usersChoice == correctAnswer {
            userPoints += 1
            return true
        } else {
            return false
        }
    }
}
