//
//  ContentView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

struct ListView: View {

    @StateObject private var viewModel = ListViewModel()
    @State var taskList: [Task]
    
    var body: some View {
        
        NavigationView {
            ZStack {
//                Color("Background")
//                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(taskList) { task in
                        ListItemsView(task: task)
                    }
                    .onDelete { indexSet in
                        viewModel.delete(tasks: &taskList, indexSet: indexSet)
                    }
                    .onMove { from, to in
                        viewModel.move(tasks: &taskList, from: from, to: to)
                    }
                }
                .listStyle(.sidebar)
                .navigationBarItems(leading: EditButton())
                
            }.navigationTitle(Text("Tasks"))
                .toolbar {
                    Button {
                        viewModel.showingTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $viewModel.showingTask) {
                        TaskView(taskList: $taskList)
                    }
                }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView(taskList: [Task].init())

//            ListView()
//                .environment(\.colorScheme, .dark)
        }
    }
}
