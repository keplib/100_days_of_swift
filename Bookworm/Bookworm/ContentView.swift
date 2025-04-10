//
//  ContentView.swift
//  Bookworm
//
//  Created by Balázs Képli on 4/4/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showAddBookView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
            })
            .toolbar {
                ToolbarItem {
                    Button("Add book", systemImage: "plus") {
                        showAddBookView.toggle()
                    }
                }
            }
            .sheet(isPresented: $showAddBookView) {
                AddBookView()
            }
        }
    }
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Book.self, configurations: config)

    let context = container.mainContext
    
    let sample = Book(title: "Test Book", author: "Alfred Mustermann", genre: "Poetry", review: "Beautifully written poems", rating: 5)
        context.insert(sample)

    return ContentView()
            .modelContainer(container)
    
}
