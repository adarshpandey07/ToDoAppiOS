//
//  ListRowView.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 15/03/25.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

#Preview {
    NavigationStack{

        var item1  = ItemModel(title: "This is the first item!", isCompleted: false)

        ListRowView(item: item1 )
    }

}
