//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Adarsh Pandey on 19/03/25.
//

import SwiftUI

struct NoItemsView: View {

    @State var animate: Bool = false
    let secondaryColor  = Color("secondaryAccentColor")

    var body: some View {

        ScrollView{

            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a prdouctive person? i think you should click add button  and add a bunch of items to your todo list")
                    .padding(.bottom, 20)

                NavigationLink("Add Something 🥳", destination:AddView())
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color.accentColor: secondaryColor)
                    .cornerRadius(10)
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? Color.accentColor.opacity(0.7): secondaryColor.opacity(0.7),
                            radius: animate ? 30:10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y : animate ? -7 : 0)

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)


        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)



    }

    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }

}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("Title")

    }
}
