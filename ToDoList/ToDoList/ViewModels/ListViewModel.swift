//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 17/03/25.
//

import Foundation
import SwiftUI

class ListViewModel : ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"

    init() {
      getItems()
    }

    private func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)

        else { return}

        items = savedItems

    }

    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(item: String){
        let item = ItemModel(title: item, isCompleted: false)
        items.append(item)
    }

    func updateItems(item: ItemModel)
    {
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }

    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }


}
