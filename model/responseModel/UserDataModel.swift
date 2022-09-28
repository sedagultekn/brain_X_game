//
//  Data.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 29.08.2022.
//

import Foundation
import UIKit
struct UserDataModel:Codable{
    let id: Int
    let userName, email: String
    let photo: String?
    let level, life: Int
    let levelName: String
    let score: Int
    let userPosition: String
    let userFriends: [Arkadaslar]
    
//
//    let id: Int
//    let userName:String
//    let email: String
//    let photo: UInt32
//    let level, life: Int
//    let levelName: String
//    let score: Int
//    let userPosition: String
//    let userFriends: [Arkadaslar]


       

}
struct Arkadaslar:Codable{
    
        let id: Int
        let userName:String
        let email: String
        let photo: String?
        let level, life: Int
        let levelName: String
        let score: Int
        let userPosition: String
    
    
}





