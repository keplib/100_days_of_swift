//
//  ContentView.swift
//  iExpense
//
//  Created by Balázs Képli on 27/11/24.
//

import SwiftUI
import Observation

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus" ) {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
        }
    }
    
    func removeItems(at offSet: IndexSet) {
        expenses.items.remove(atOffsets: offSet)
    }
}

#Preview {
    ContentView()
}
