//
//  ToDoItemsViewModel.swift
//  To-Do-MVVM
//
//  Created by Binaya on 28/09/2021.
//

import SwiftUI

class ToDoItemsViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init(isForTesting: Bool = false) {
        
        if !isForTesting {
            // Get persisted data from database.
        }
        
    }
    
    // User intents methods:
    
    func addItem () {
        items.append(Item(id: UUID(), name: "Newly added Item"))
    }
    
    func moveItem(with indices: IndexSet, to newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func deleteItem (in indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    // For testing in previews to see different states:
    
    static func emptyState() -> ToDoItemsViewModel {
        let itemsVM = ToDoItemsViewModel(isForTesting: true)
        itemsVM.items = []
        return itemsVM
    }
    
    static func fullState() -> ToDoItemsViewModel {
        let itemsVM = ToDoItemsViewModel(isForTesting: true)
        itemsVM.items = [
            Item(id: UUID(), name: "Item 1"),
            Item(id: UUID(), name: "Item 2"),
            Item(id: UUID(), name: "Item 3")
        ]
        return itemsVM
    }
    
}
