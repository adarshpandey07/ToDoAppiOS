//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 14/03/25.
//

import SwiftUI

@main
struct ToDoListApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
