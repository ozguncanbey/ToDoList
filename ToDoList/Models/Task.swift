//
//  Task.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: String
    let title: String
    let date: String
    var isDone: Bool
    
    init(id: String = UUID().uuidString, title: String, date: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.date = date
        self.isDone = isDone
    }
    
    func updateCompletion() -> Task {
        return Task(id: id, title: title, date: date, isDone: !isDone)
    }
}
