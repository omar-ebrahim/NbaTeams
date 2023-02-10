//
//  LastMeeting.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 10/02/2023.
//

import Foundation

struct LastMeeting: Decodable {
    let gameId: String
    let lastGameId: String
    let lastGameDateEst: String // EST = Eastern Standard Time
    let lastGameHomeTeamId: Int
    let lastGameHomeTeamCity: String
    let lastGameHomeTeamName: String
    let lastGameHomeTeamAbbreviation: String
    let lastGameHomeTeamPoints: Int
    let lastGameVisitorTeamId: Int
    let lastGameVisitorTeamCity: String
    let lastGameVisitorTeamName: String
    let lastGameVisitorTeamCity1: String
    let lastGameVisitorTeamPoints: Int
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        gameId = try container.decode(String.self)
        lastGameId = try container.decode(String.self)
        lastGameDateEst = try container.decode(String.self)
        lastGameHomeTeamId = try container.decode(Int.self)
        lastGameHomeTeamCity = try container.decode(String.self)
        lastGameHomeTeamName = try container.decode(String.self)
        lastGameHomeTeamAbbreviation = try container.decode(String.self)
        lastGameHomeTeamPoints = try container.decode(Int.self)
        lastGameVisitorTeamId = try container.decode(Int.self)
        lastGameVisitorTeamCity = try container.decode(String.self)
        lastGameVisitorTeamName = try container.decode(String.self)
        lastGameVisitorTeamCity1 = try container.decode(String.self)
        lastGameVisitorTeamPoints = try container.decode(Int.self)
    }
}
