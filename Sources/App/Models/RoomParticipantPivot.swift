//
//  RoomParticipantPivot.swift
//  
//
//  Created by Elizaveta Shelemekh on 28.03.2023.
//

import Fluent
import Vapor

final class RoomParticipantPivot: Model {
  static let schema = "room_participant"
  
  @ID(key: "id")
  var id: UUID?
  
  @Parent(key: "room_id")
  var room: Room
  
  @Parent(key: "participant_id")
  var participant: User
  
  init() {}
  
  init(id: UUID? = nil, roomId: Room.IDValue, participantId: User.IDValue) {
    self.id = id
    self.room.id = roomId
    self.$participant.id = participantId
  }
}
