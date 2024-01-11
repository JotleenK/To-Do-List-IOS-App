//
//  ViewModel.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 10/01/24.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var items: [Item] = []
    
    let key: String = "itemKey"
    
    init() {
        addItems()
    }
    
    func addItems() {
        guard
            let dataToDecode = UserDefaults.standard.data(forKey: key),
            let decodedItems = try? JSONDecoder().decode([Item].self, from: dataToDecode)
        else {
            return
        }
        
        items.append(contentsOf: decodedItems)
    }
    
    func deleteItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
        saveList()
    }
    
    func moveItem(fromIndex : IndexSet, toIndex : Int) {
        items.move(fromOffsets: fromIndex, toOffset: toIndex)
        saveList()
    }
    
    func addItem(name: String) {
        let newItem = Item(completed: false, itemName: name)
        items.append(newItem )
        saveList()
    }
    
    func completeItem(item: Item) {
        if let index = items.firstIndex { (initialItem) -> Bool in
            return initialItem.id == item.id
        }
        {
            items[index] = item.itemCompleted()
        }
        saveList()
    }
    
    func saveList() {
        if let encodedList = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedList, forKey: key)
        }
    }
}
