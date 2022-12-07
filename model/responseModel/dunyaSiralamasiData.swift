//
//  dunyaSiralamasiData.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 7.12.2022.
//

import Foundation
struct DunyaSiralamasiData:Codable {
    let code: String
    let data: [User]
}

// MARK: - Datum
struct User :Codable{
    let place: String
    let id: Int
    let userName: String
    let level: Int
    let levelName: String?
    let score: String
}
