//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import Foundation

protocol ListViewModelProtocol {
    
}

final class ListViewModel: ObservableObject {
    @Published var showingTask = false
    
}

extension ListViewModel: ListViewModelProtocol {
    
}
