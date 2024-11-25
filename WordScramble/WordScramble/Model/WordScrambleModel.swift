//
//  WordScrambleModel.swift
//  WordScramble
//
//  Created by Balázs Képli on 19/11/24.
//

import Foundation
import UIKit


struct WordScrambleModel {
    
     var usedWords: Array<String>
     var rootWord: String
    
    
    init(wordList: Array<String>) {
        rootWord = wordList.randomElement() ?? "silkworm"
        usedWords = [String]()
    }
    
    
    mutating func addNewWord(newWord: String) -> FeedabckAfterAddingWord {
        print(newWord)
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return .emptyWord }
        
        guard isOriginal(word: answer) else {
            return .notOriginal
        }
        
        guard isPossible(word: answer) else {
            return .notPossible
        }
        
        guard isReal(word: answer) else {
            return .notReal
        }
        
        usedWords.append(newWord)
        return .success
    }
 

//        
//        withAnimation {
//            usedWords.insert(answer, at: 0)
//        }
//        
//        newWord = ""
//    }

    
    // HELPER FUNCTIONS FOR WORD CHECKINGS
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
}

enum FeedabckAfterAddingWord {
    case emptyWord
    case notOriginal
    case notPossible
    case notReal
    case success
}
