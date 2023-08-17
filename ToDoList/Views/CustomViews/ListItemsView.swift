//
//  ListItemsView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 17.08.2023.
//

import SwiftUI

struct ListItemsView: View {
    @StateObject var viewModel = ListItemsViewModel()
    var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title!)
                    .font(.title3)
                
                Text(task.date!)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 0.5)
            }
            
            Spacer()
            
            Button {
                //viewModel.toggleIsDone(task: &task)
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView(task: Task.init(title: "Buy Egg", date: "12/12/12", isDone: false))
    }
}
