//
//  getRooms.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 23.11.2022.
//


    import Foundation
struct GetRooms:Decodable {
    let code: String
    let data: RoomsData
}

// MARK: - Datum
struct RoomsData:Decodable {
    let id: Int
    let type: String
    let userCount, currentUserCount, createdUserID: Int
    let createdUser: CreatedUserRoom
    let atRoomUsers: Int
}

// MARK: - CreatedUser
struct CreatedUserRoom :Decodable {
    let id: Int
    let userName: String
    let email, photo: String
    let level, life: Int
    let levelName: String
    let score: Int
    let userPosition: String
    let userFriends: String
}
