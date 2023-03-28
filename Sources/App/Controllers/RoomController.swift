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
        
        // roomsRoute.get(":roomId", use: getDinner)
        // roomsRoute.put(":dinnerId", "invite", ":userId", use: inviteUser)
        
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
        
    }
}
