//
//  RoomController.swift
//  
//
//  Created by Elizaveta Shelemekh on 27.03.2023.
//

import Vapor
import Fluent


struct RoomController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let roomsRoute = routes.grouped("rooms")
        
        roomsRoute.post("new") { req -> EventLoopFuture<Room> in
            let room = try req.content.decode(Room.self)
            return room.save(on: req.db).map { room }
        }
        
        roomsRoute.get("all") { req -> EventLoopFuture<[Room]> in
            return Room.query(on: req.db).all()
        }
        
        roomsRoute.get("public") { req -> EventLoopFuture<[Room]> in
            return Room.query(on: req.db).filter(\.$isPublic == true).all()
        }
        
        roomsRoute.get(":id") { req -> EventLoopFuture<Room> in
            let roomId = req.parameters.get("id", as: UUID.self)
            return Room.find(roomId, on: req.db).unwrap(or: Abort(.notFound))
        }
        
        roomsRoute.post(":roomId", "join", ":userId") { req -> EventLoopFuture<RoomParticipantPivot> in
            //  roomsRoute.post("join") { req -> EventLoopFuture<RoomParticipantPivot> in
            
            let userId = req.parameters.get("userId", as: UUID.self)
            let roomId = req.parameters.get("roomId", as: UUID.self)
            
            // let room = try? req.content.decode(RoomParticipantPivot.self)
            let room = RoomParticipantPivot(roomId: roomId, participantId: userId)
            return room.save(on: req.db).map { room }
        }
    }
}
