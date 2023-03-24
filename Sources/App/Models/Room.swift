//
//  Room.swift
//  
//
//  Created by Elizaveta Shelemekh on 24.03.2023.
//

import Vapor
import Fluent

final class Room: Model, Content {
    
    static let schema = "rooms"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "isPublic")
    var isPublic: Bool
    
    @Field(key: "admin")
    var admin: UUID
    
    @Field(key: "code")
    var invitationCode: String?
    
    struct Settings {
        
        @Field(key: "pointsToWin")
        var pointsToWin: Int
        
        @Field(key: "roundTime")
        var roundTime: Int
        
        @Field(key: "teamsCount")
        var teamsCount: Int
    }
    
    init() {}
    
    init(id: UUID? = nil, isPublic: Bool, admin: UUID, invitationCode: String? = nil) {
        self.id = id
        self.isPublic = isPublic
        self.admin = admin
        self.invitationCode = invitationCode
    }
}
