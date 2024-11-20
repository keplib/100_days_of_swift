//
//  WordScrambleVM.swift
//  WordScramble
//
//  Created by Balázs Képli on 19/11/24.
//

import Foundation

class WordScrambleVM: ObservableObject {
    
    @Published  var errorTitle = ""
    @Published  var errorMessage = ""
    @Published  var showingError = false
    
    
    private static func getWordList() -> Array<String> {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                return startWords.components(separatedBy: "\n")
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    private static func createWordScramble () -> WordScrambleModel {
        return WordScrambleModel(wordList: getWordList())
    }
    
    private var game = createWordScramble()
    
    var rootWord: String {
        game.rootWord
    }
    
}
