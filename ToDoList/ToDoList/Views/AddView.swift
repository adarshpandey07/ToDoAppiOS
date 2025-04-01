//
//  AddView.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 15/03/25.
//

import SwiftUI

struct AddView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel:  ListViewModel
    @State var textFieldtext: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""

    var body: some View {

        ScrollView{
            VStack {
                TextField("Type Something here ...", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .font(.headline)

                })

            }
            .padding(16)

        }
        .navigationTitle("Add an item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if textIsAppropreiate(){
            listViewModel.addItem(item: textFieldtext)
            dismiss()
        }

    }

    func textIsAppropreiate() -> Bool {
        if(textFieldtext.count < 3){
            alertTitle = "Please enter atleast 3 characters 🙂‍↕️😨😤😶‍🌫️"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
