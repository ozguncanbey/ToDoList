//
//  ContentView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

struct ListView: View {
    
    @State private var taskList: [Task]? = []
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
//                Color("Background")
//                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(taskList!) { task in
                        VStack {
                            Text(task.title!)
                            
                            Text((task.date?.formatted())!)
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        }
                    }
                }
                
            }.navigationTitle(Text("Tasks"))
                .toolbar {
                    Button {
                        viewModel.showingTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $viewModel.showingTask) {
                        TaskView()
                    }
                }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
            
//            ListView()
//                .environment(\.colorScheme, .dark)
        }
    }
}
