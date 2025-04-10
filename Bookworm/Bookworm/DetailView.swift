//
//  DetailView.swift
//  Bookworm
//
//  Created by Balázs Képli on 10/4/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.7))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .font(.body)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
       
    }
    
}

#Preview {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Error loading preview data: \(error.localizedDescription)")
    }
     
}
