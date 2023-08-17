//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(taskList: [Task].init())
        }
    }
}
