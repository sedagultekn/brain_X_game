//
//  dunyaSiralamasiModel.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 13.09.2022.
//

import Foundation
struct DunyaSiralamasiModel:Codable {
    let code: String
    let data: [ScoreSiralama]
}
struct ScoreSiralama:Codable {
    let place : Int
    let id : Int
    let userName: String
    let level :Int
    let levelName: String
    let score : Int
    
}
