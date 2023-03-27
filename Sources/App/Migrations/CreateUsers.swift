//
//  File.swift
//  
//
//  Created by Kate on 27.03.2023.
//

import Fluent

struct CreateUsers: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("username", .string, .required)
            .unique(on: "username")
            .field("password_hash", .string, .required)
            .field("created_at", .datetime, .required)
            .field("updated_at", .datetime, .required)
            .field("roomId", .uuid, .references("rooms", "id"))
            .field("teamNumber", .int)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users").delete()
    }
}
