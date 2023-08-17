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
}

final class ListViewModel: ObservableObject {
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
}
