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
            .id()
            .field("isPublic", .bool, .required)
            .unique(on: "id")
            .field("admin", .uuid, .references("users", "id"))
            .field("code", .string)
            .field("pointsToWin", .int32)
            .field("roundTime", .int32)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rooms").delete()
    }
}
