import Foundation

public struct Todo: Codable, Identifiable {
    /// The identfier
    public var id: UUID
    public var title: String
    public var createdAt: Date
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
