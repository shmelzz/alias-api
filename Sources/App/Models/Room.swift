import Vapor
import Fluent

final class Room: Model, Content {
    
    static let schema = "rooms"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "isPublic")
    var isPublic: Bool
    
    @Parent(key: "admin")
    var admin: User
    
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
    
    init(id: UUID? = nil, isPublic: Bool, admin: User.IDValue, invitationCode: String? = nil) {
        self.id = id
        self.isPublic = isPublic
        self.$admin.id = admin
        self.invitationCode = invitationCode
    }
}
