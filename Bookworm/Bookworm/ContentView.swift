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
    ContentView()
}
