//
//  CheckConfirmationCodeResponse.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 15.09.2022.
//

import Foundation
struct CheckConfirmationCodeResponse:Codable {
    let code: String
    let data: String
}
