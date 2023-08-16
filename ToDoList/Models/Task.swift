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
    let date: Date?
}
