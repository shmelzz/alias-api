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
        roomsRoute.post("new", use: create)
        roomsRoute.get("all", use: index)
        // roomsRoute.put(":dinnerId", "invite", ":userId", use: inviteUser)
    }
    
    fileprivate func create(req: Request) throws -> EventLoopFuture<Room>  {
        let admin = try req.auth.require(User.self)
        
        let room = try req.content.decode(Room.self)
        room.$admin.id = admin.id ?? UUID()
        return room.save(on: req.db).map { room }
    }
    
    
    func index(req: Request) throws -> EventLoopFuture<[Room]> {
        return Room.query(on: req.db).all()
    }
    
    //    fileprivate func getRoom(req: Request) throws -> EventLoopFuture<Room.Public> {
    //      guard let roomId = req.parameters.get("roomId", as: UUID.self) else {
    //          throw Abort(.badRequest)
    //      }
    //
    //      return Room.query(on: req.db)
    //        .filter(\.$id == roomId)
    //        .with(\.$admin)
    //        .first()
    //        .unwrap(or: Abort(.notFound))
    //        .flatMapThrowing { try $0.self() }
    //    }
    
    
}
