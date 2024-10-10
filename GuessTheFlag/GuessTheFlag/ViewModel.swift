//
//  ViewModel.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 10/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    // This is the content for the game that will be sent down to the initializer of the GameModel
    private static let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    // And this function creates an instance of GameModel
    private static func createFlagGame () -> GameModel<String> {
        return GameModel(countryNames: countries)
    }
    
    // Create an instance of FlagGame that is going to be only available here so the VM can interact with the model
    private var game = createFlagGame()
    
    //These are the variables from the model that the VM makes available for the UI (read only)
    var flags: Array<String> {
        return game.flags
    }
    
    // Itt at lehetne terni
    // var flagsToShow: Array<String> { return game.flagsToShow }
    
    var correctAnswer: Int {
        return game.correctAnswer
    }
    
    var userScore: Int {
        return game.userPoints
    }
    
    //These on the other hand are variables that the UI need (e.g. showAlert) that are NOT part of the model. So these only exist as a part of the VM
    @Published var showAlert: Bool = false
    @Published var popupHeader: String = ""
    
   
   //And here are the functions to interact with the model. These function can be triggered from the UI as vm.getQuestion() and then the VM triggers the model's internal methods
    func getQuestion() {
        game.askQuestion()
    }
    
    func clickFlag(_ chosenFlag: Int) {
        let result = game.flagTapped(chosenFlag)
        
        if result {
            popupHeader = "Correct"
            
        } else {
            popupHeader = "Wrong"
        }
        showAlert = true
    }
}
