//
//  ViewListRow.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 9/01/24.
//

import SwiftUI

struct ViewListRow: View {
    
    let item: Item
    
    var body: some View {
        
        HStack {
            Image(systemName: item.completed ? "checkmark.circle" : "circle")
                .foregroundColor(item.completed ? .green : .red)
                
            Text(item.itemName)
            Spacer()
        }
    }
}

struct ViewListRow_Previews: PreviewProvider {
    
    static var item1 = Item(completed: true, itemName: "First item")
    static var item2 = Item(completed: false, itemName: "Second item")
    
    static var previews: some View {
        
        Group {
            ViewListRow(item: item1)
            ViewListRow(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

