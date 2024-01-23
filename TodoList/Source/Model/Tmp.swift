//
//  Tmp.swift
//  TodoList
//
//  Created by yangtz on 2024/1/22.
//

import Foundation

public struct Title: Codable, Identifiable {
    /// The identfier
    public var id: UUID
    /// The title of Title
    public var title: String
    /// Create a todo
    /// - Parameters:
    ///   - id: The identifier of the todo.
    ///   - title: The title
    ///   - createdAt: The creation date of the todo
    public init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}

extension Title {
    static var Completed: Title {
        .init(title: "Completed")
    }
    static var InCompleted: Title {
        .init(title: "InCompleted")
    }
}

