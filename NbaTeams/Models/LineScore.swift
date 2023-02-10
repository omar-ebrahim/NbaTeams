//
//  LineScore.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 10/02/2023.
//

import Foundation

// There will be two of these - first one is Home, second is Visitor
struct LineScore: Decodable {
    let gameDateEst: String
    let gameSequence: Int
    let gameId: String
    let teamId: Int
    let teamAbbreviation: String
    let teamCityName: String
    let teamNickName: String
    let teamWinsLosses: String
    let pointsQuarter2 : Int
    let pointsQuarter3: Int
    let pointsQuarter4: Int
    let pointsOvertime1: Int
    let pointsOvertime2: Int
    let pointsOvertime3: Int
    let pointsOvertime4: Int
    let pointsOvertime5: Int
    let pointsOvertime6: Int
    let pointsOvertime7: Int
    let pointsOvertime8: Int
    let pointsOvertime9: Int
    let pointsOvertime10: Int
    let points: Int
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        gameDateEst = try container.decode(String.self) // It's in UTC format
        gameSequence = try container.decode(Int.self)
        gameId = try container.decode(String.self)
        teamId = try container.decode(Int.self)
        teamAbbreviation = try container.decode(String.self)
        teamCityName = try container.decode(String.self)
        teamNickName = try container.decode(String.self)
        teamWinsLosses = try container.decode(String.self)
        pointsQuarter2  = try container.decode(Int.self)
        pointsQuarter3 = try container.decode(Int.self)
        pointsQuarter4 = try container.decode(Int.self)
        pointsOvertime1 = try container.decode(Int.self)
        pointsOvertime2 = try container.decode(Int.self)
        pointsOvertime3 = try container.decode(Int.self)
        pointsOvertime4 = try container.decode(Int.self)
        pointsOvertime5 = try container.decode(Int.self)
        pointsOvertime6 = try container.decode(Int.self)
        pointsOvertime7 = try container.decode(Int.self)
        pointsOvertime8 = try container.decode(Int.self)
        pointsOvertime9 = try container.decode(Int.self)
        pointsOvertime10 = try container.decode(Int.self)
        points = try container.decode(Int.self)
    }
}
