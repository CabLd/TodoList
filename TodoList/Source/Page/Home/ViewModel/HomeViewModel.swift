//
//  ListViewModel.swift
//  TodoList
//
//  Created by yangtz on 2024/1/23.
//

import Foundation
import LegoKit
import UIKit

class HomeViewModel: LegoObservableObject {

    /// Description: listPoll  includes completes and incomplete
    @LegoPublished var todos: [Todo] = []

    var incompleteTodos: [Todo] {
        todos.filter { $0.finishedAt == nil }
            .sorted { $0.createdAt > $1.createdAt }
    }
    var completeTodos: [Todo] {
        todos.filter { $0.finishedAt != nil }
            .sorted { $0.finishedAt! < $1.finishedAt! }
    }

    init() {}

    func createNewTodo(title: String) {
        print("创建一个新的Todo")
        todos.append(Todo(title: title))
    }

    func toggleTodo(_ todo: Todo) {
        print("响应到点击事件, 更改todos[index]的flag")
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }
        if todos[index].finishedAt == nil {
            todos[index].finishedAt = Date()
        } else {
            todos[index].finishedAt = nil
        }
    }

    func ModifyTodo(id: UUID, Message: String) {
        guard let index = todos.firstIndex(where: { $0.id == id}) else {
            print("Modify error")
            return
        }
        todos[index].title = Message
    }
}



