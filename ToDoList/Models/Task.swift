//
//  Task.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String?
    let date: String?
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    init(title: String?, date: String?, isDone: Bool) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
