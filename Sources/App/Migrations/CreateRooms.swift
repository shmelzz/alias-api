//
//  File.swift
//
//
//  Created by Kate on 27.03.2023.
//

import Fluent

struct CreateRooms: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rooms")
            .field("id", .uuid, .identifier(auto: true))
            .field("isPublic", .bool, .required)
            .unique(on: "id")
            .field("admin", .uuid, .references("users", "id"))
            .field("code", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rooms").delete()
    }
}
