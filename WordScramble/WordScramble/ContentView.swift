//
//  ContentView.swift
//  WordScramble
//
//  Created by Balázs Képli on 11/10/24.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject private var viewModel = WordScrambleVM()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $viewModel.newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(viewModel.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                    }
                }
            }
            .navigationTitle(viewModel.rootWord)
            .onSubmit {
                viewModel.addNewWord(word: viewModel.newWord)
            }
            .alert(viewModel.feedbackToUser.feddbackTitle, isPresented: $viewModel.showingError) {
                Button("OK") {}
            } message: {
                Text(viewModel.feedbackToUser.FeedbackMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
