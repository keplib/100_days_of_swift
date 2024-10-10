//
//  GameModel.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 10/10/24.
//

import Foundation


struct GameModel<FlagContent> {
    
    // These are the variables the game logice needs to know about
    var flags: Array<FlagContent>
    var userPoints: Int
    var correctAnswer: Int
    var usersChoice: Int
    
    init(countryNames: Array<FlagContent>) {
        // Itt eleg lenne csak az elso 3 kartyat mutatni
        // flagsToShow = flags[0..3]
        // a UI-nak tobb info nem kell
        // Plusz, countryNames.shuffled(), kulonben mindig ugyanugy indul majd a jatek, ugyanazzal a 3 kartyaval
        flags = countryNames
        userPoints = 0
        correctAnswer = Int.random(in: 0...2)
        usersChoice = 0
    }
    
    mutating func askQuestion () {
        //itt is, csak az elso 3 kartya
        // flagsToShow = flags.shuffle()[0..3]
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
