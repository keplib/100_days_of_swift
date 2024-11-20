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
    @Published var newWord = ""
    
    
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
    
    var usedWords: Array<String> {
        game.usedWords
    }
    
    func addNewWord(word: String) {
        let result = game.addNewWord(newWord: word)
        
        print(result)
    }
    
}


//
//    func addNewWord() {
//
//
//        guard isOriginal(word: answer) else {
//            wordError(title: "Word used already", message: "Be more original")
//            return
//        }
//
//        guard isPossible(word: answer) else {
//            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord) !'")
//            return
//        }
//
//        guard isReal(word: answer) else {
//            wordError(title: "Word not recognized", message: "You just can't make them up, you know!")
//            return
//        }
//
//        withAnimation {
//            usedWords.insert(answer, at: 0)
//        }
//
//        newWord = ""
//    }
