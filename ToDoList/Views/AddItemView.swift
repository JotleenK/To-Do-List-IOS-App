//
//  AddItemView.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 9/01/24.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presMode
    @EnvironmentObject var viewModel : ViewModel
    @State var textFieldString : String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                
                TextField("Add item here", text: $textFieldString)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5)))
                    .cornerRadius(15)
                    .padding(10)
                
                Button(action: saveButton, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 100)
                        .background(Color.orange)
                        .cornerRadius(30)
                })
            }
            
        }
        .navigationTitle("Add Item")
        
    }
    
    func saveButton() {
        viewModel.addItem(name: textFieldString )
        presMode.wrappedValue.dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
        }
        .environmentObject(ViewModel())
    }
}
