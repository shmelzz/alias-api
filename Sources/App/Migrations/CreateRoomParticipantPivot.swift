//
//  CreateRoomParticipantPivot.swift
//  
//
//  Created by Elizaveta Shelemekh on 28.03.2023.
//

import Fluent
import Vapor

struct CreateRoomParticipantPivot: Migration {
    
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema(RoomParticipantPivot.schema)
      .id()
      .field("participant_id", .uuid, .references("users", "id"))
      .field("room_id", .uuid, .references("rooms", "id"))
      .unique(on: "participant_id")
      .create()
  }
  
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema(RoomParticipantPivot.schema).delete()
  }
}
