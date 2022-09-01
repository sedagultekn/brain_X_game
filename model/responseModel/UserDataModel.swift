//
//  Data.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 29.08.2022.
//

import Foundation
struct UserDataModel:Codable{
    let id: String
    let userName : String
    let email: String
    let photo :Int
    let level:Int
    let life:Int
    let levelName: String
    let score:Int
    let userPosition: String
    //"userFriends": []
}
