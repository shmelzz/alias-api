import Vapor
import Fluent

final class Room: Model, Content {
    
//    struct Public: Content {
//        let isPublic: Bool
//        let id: UUID
//        let admin : User
//    }
    
    static let schema = "rooms"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "isPublic")
    var isPublic: Bool
    
    @Parent(key: "admin")
    var admin: User
    
    @OptionalField(key: "code")
    var invitationCode: String?

    @Field(key: "pointsToWin")
    var pointsToWin: Int

    @Field(key: "roundTime")
    var roundTime: Int
    
    @Siblings(through: RoomParticipantPivot.self, from: \.$room, to: \.$participant)
    var players: [User]
    
    init() {}
    
    init(id: UUID? = nil, isPublic: Bool, admin: User.IDValue, invitationCode: String? = nil, pointsToWin: Int = 2, roundTime: Int = 60) {
        self.id = id
        self.isPublic = isPublic
        self.$admin.id = admin
        self.invitationCode = invitationCode
        self.pointsToWin = pointsToWin
        self.roundTime = roundTime
    }
}
