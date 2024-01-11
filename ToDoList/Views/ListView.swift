//
//  ListView.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 9/01/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List {
            
            ForEach(viewModel.items) { item in
        
                ViewListRow(item: item)
                    .onTapGesture {
                        withAnimation(.smooth) {
                            viewModel.completeItem(item: item) 
                        }
                    }
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Do:")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add Item ", destination: 
                    AddItemView()
                )
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ViewModel())
    }
}
