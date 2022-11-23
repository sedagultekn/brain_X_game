//
//  getRooms.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 23.11.2022.
//


    import Foundation
struct getRoomsUsers{
        let code: String
        let data: DataClass
    }

    
    struct DataClass {
        let id: Int
        let type: String
        let userCount, currentUserCount, createdUserID: Int
        let createdUser: NSNull
        let atRoomUsers: [AtRoomUser]
    }

    
    struct AtRoomUser {
        let id: Int
        let userName: String
        let email, photo: NSNull
        let level, life: Int
        let levelName: String
        let score: Int
        let userPosition: String
        let userFriends: NSNull
    }
