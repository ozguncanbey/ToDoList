//
//  ContentView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

struct ListView: View {
    @State private var showingTask = false
    @State private var taskList: [Task]? = []
    
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
                        showingTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $showingTask) {
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

struct Task: Identifiable {
    let id = UUID()
    let title: String?
    let date: Date?
}
