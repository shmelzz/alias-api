//
//  RoomParticipantPivot.swift
//  
//
//  Created by Elizaveta Shelemekh on 28.03.2023.
//

import Fluent
import Vapor

final class RoomParticipantPivot: Model, Content {
    static let schema = "room_participant"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "room_id")
    var room: UUID?
    
    @Field(key: "participant_id")
    var participant: UUID?
    
    init() {}
    
    init(id: UUID? = nil, roomId: UUID? = nil, participantId: UUID? = nil) {
        self.id = id
        self.room = roomId
        self.participant = participantId
    }
}
