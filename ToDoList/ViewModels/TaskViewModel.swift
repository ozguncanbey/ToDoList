//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

protocol TaskViewModelProtocol {
    func save()
    func canSave() -> Bool
}

final class TaskViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
}

extension TaskViewModel: TaskViewModelProtocol {
    func save() {
        
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        return true
    }
}
