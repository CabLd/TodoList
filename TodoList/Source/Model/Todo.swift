import Foundation

public struct Todo: Codable, Identifiable {
    /// The identfier
    public var id: UUID
    /// The title of todo
    public var title: String
    /// The createdAt of todo
    public var createdAt: Date
    /// The finishedAt of todo
    public var finishedAt: Date?
    /// Create a todo
    /// - Parameters:
    ///   - id: The identifier of the todo.
    ///   - title: The title
    ///   - createdAt: The creation date of the todo
    public init(id: UUID = UUID(), title: String, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
    }
}

// MARK: - extend a dummy
extension Todo {
    static var dummy: Todo {
        .init(title: "Hello World")
    }
}
