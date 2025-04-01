//
//  ListView.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 14/03/25.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel : ListViewModel


    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
            } else {
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItems(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)

                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddView())
            )
    }

}

#Preview {
    NavigationStack{
        ListView()
            .environmentObject(ListViewModel())
    }
}


