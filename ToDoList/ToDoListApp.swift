//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jotleen Kaur on 9/01/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(viewModel)
        }
    }
}
