//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

protocol ListViewModelProtocol {
    func delete(tasks: inout [Task], indexSet: IndexSet)
    func move(tasks: inout [Task], from: IndexSet, to: Int)
    func update(task: Task, tasks: inout [Task])
}

final class ListViewModel: ObservableObject {
    //@Published var tasks: [Task] = []
    init() {}
    @Published var showingTask = false
}

extension ListViewModel: ListViewModelProtocol {
    func delete(tasks: inout [Task], indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func move(tasks: inout [Task], from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func update(task: Task, tasks: inout [Task]) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompletion()
        }
    }
}
