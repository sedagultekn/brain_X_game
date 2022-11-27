//
//  rooms.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 24.11.2022.
//

import Foundation


// MARK: - Welcome10
struct Welcome10 {
    let code: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum {
    let id: Int
    let type: TypeUnion
    let userCount, currentUserCount, createdUserID: Int
    let createdUser: CreatedUser
    let atRoomUsers: NSNull
}

// MARK: - CreatedUser
struct CreatedUser {
    let id: Int
    let userName: String
    let email, photo: NSNull
    let level, life: Int
    let levelName: NSNull
    let score: Int
    let userPosition: UserPosition
    let userFriends: NSNull
}

enum UserPosition {
    case online
}

enum TypeUnion {
    case integer(Int)
    case string(String)
}
