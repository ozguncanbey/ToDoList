//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

protocol TaskViewModelProtocol {
    func save() -> Task?
    func canSave() -> Bool
}

final class TaskViewModel: ObservableObject {
    init() {}
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
}

extension TaskViewModel: TaskViewModelProtocol {
    func save() -> Task? {
        guard canSave() else { return nil }
        
        let newTask = Task(title: title, date: date.formatted(), isDone: false)
        
        return newTask
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        return true
    }
}
