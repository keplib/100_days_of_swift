//
//  ViewModel.swift
//  GuessTheFlag
//
//  Created by Balázs Képli on 10/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    private static let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    @Published var showAlert: Bool = false
    @Published private var game = createFlagGame()
    @Published var popupHeader: String = ""
    
    
    private static func createFlagGame () -> GameModel<String> {
        return GameModel(countryNames: countries)
    }
    
    var flags: Array<String> {
        return game.flags
       }
    
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
    }
}
