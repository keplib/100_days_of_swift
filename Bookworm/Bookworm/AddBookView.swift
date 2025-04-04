//
//  AddBookView.swift
//  Bookworm
//
//  Created by Balázs Képli on 4/4/25.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = ""
    @State private var rating: Int = 3
    @State private var review: String = ""
    
    let genres = ["Action", "Adventure", "Fantasy", "Historical", "Mystery", "Romance", "Science Fiction", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                        .frame(minHeight: 100)
                    Picker("Rating", selection: $rating) {
                        ForEach(1...5, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section {
                    Button("Save book") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

#Preview {
    AddBookView()
}
