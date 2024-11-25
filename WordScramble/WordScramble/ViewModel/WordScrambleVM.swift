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
    @Published  var newWord = ""
    @Published  var feedbackToUser: Feedback = Feedback(feddbackTitle: "", FeedbackMessage: "")
    
    
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
        
        setFeedback(feedbackType: result)
        showingError = true
        
        newWord = ""
        
    }
    
    
    // Helper fucntion to generate an appropriate feedback title and message for UI
    func setFeedback(feedbackType: FeedabckAfterAddingWord) {
        switch feedbackType {
        case .emptyWord:
            feedbackToUser = Feedback(feddbackTitle: "Empty addition", FeedbackMessage: "You cannot submit words with no characters!")
        case .notOriginal:
            feedbackToUser = Feedback(feddbackTitle: "Word used already", FeedbackMessage: "Be more original")
        case .notPossible:
            feedbackToUser = Feedback(feddbackTitle: "Word not possible", FeedbackMessage: "You can't spell that word from '\(rootWord) !'")
        case .notReal:
            feedbackToUser = Feedback(feddbackTitle: "Word not recognized", FeedbackMessage: "You just can't make them up, you know!")
        case .success:
            feedbackToUser = Feedback(feddbackTitle: "Perfect!", FeedbackMessage: "Word's been added to your list!")
            
        }
    
        
    }
    
}

struct Feedback {
    var feddbackTitle: String
    var FeedbackMessage: String
}

