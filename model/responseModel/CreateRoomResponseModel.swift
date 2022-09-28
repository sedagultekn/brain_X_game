//
//  CreateRoomResponseModel.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 14.09.2022.
//

import Foundation
struct CreateRoomResponseModel: Codable{
    let code:String
    let data: CreateRoomDataModel
}

struct CreateRoomDataModel:Codable{
    let id: Int
    let type : String
    let userCount : Int
    let currentUserCount : Int
    let createdUserId : Int
    let createdUser : String
    let atRoomUsers : String
}
