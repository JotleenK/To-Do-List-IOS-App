//
//  Item.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 9/01/24.
//

import Foundation

struct Item: Identifiable, Codable{
    let id: String
    let completed: Bool
    let itemName: String
    
    init(id: String = UUID().uuidString, completed: Bool, itemName: String) {
        self.id = id
        self.completed = completed
        self.itemName = itemName
    }
    
    func itemCompleted() -> Item {
        return Item(id: id, completed: !completed, itemName: itemName)
    }
    
}



