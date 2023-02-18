//
//  GameInfo.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 18/02/2023.
//

import Foundation

struct GameInfo: Decodable {
    let gameDate: String
    let attendance: Int
    let gameTime: String
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        gameDate = try container.decode(String.self)
        attendance = try container.decode(Int.self)
        gameTime = try container.decode(String.self)
    }
}
