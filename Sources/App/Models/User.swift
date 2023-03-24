//
//  File.swift
//  
//
//  Created by Elizaveta Shelemekh on 24.03.2023.
//

import Vapor
import Fluent

final class User: Model, Content {

    static let schema = "users"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "roomID")
    var roomID: UUID?
    
    @Field(key: "teamNumber")
    var teamNumber: Int?
    
    init() {}
    
    init(id: UUID? = nil, username: String, password: String, roomID: UUID? = nil, teamNumber: Int? = nil) {
        self.id = id
        self.username = username
        self.password = password
        self.roomID = roomID
        self.teamNumber = teamNumber
    }
}

