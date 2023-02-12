//
//  TeamGameLog.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 10/02/2023.
//

import Foundation

struct TeamGameLogDto: Hashable, Decodable, Identifiable {
    let id: UUID
    let teamId: Int
    let gameId: String
    let gameDate: String
    let matchup: String
    let winOrLoss: String
    let points: Int
}

struct TeamGameLog: Hashable, Decodable, Identifiable {
    
    // it doesn't matter what ID this is, this is required to stop a multiple ID warning
    // when it generates the list of TeamGameLog row cards
    let id: UUID = UUID()
    
    let teamId: Int
    let gameId: String
    let gameDate: String
    let matchup: String
    let winOrLoss: String
    let wins: Int
    let losses: Int
    let winPercentage: Double
    let minsPlayed: Int
    let fieldGoalsMade: Int
    let fieldGoalsAttempted: Int
    let fieldGoalPercentage: Double
    let fg3m: Int // field goal 3pt?
    let fg3a: Int // field goal  attempted?
    let fg3Percentage: Double // field goal 3pt percentage
    let ftm: Int
    let tfa: Int
    let ftPercentage: Double
    let offensiveRebounds: Int
    let defensiveRebounds: Int
    let assists: Int
    let steals: Int
    let blocks: Int
    let turnovers: Int
    let personalFouls: Int
    let points: Int
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        teamId = try container.decode(Int.self)
        gameId = try container.decode(String.self)
        gameDate = try container.decode(String.self)
        matchup = try container.decode(String.self)
        winOrLoss = try container.decode(String.self)
        wins = try container.decode(Int.self)
        losses = try container.decode(Int.self)
        winPercentage = try container.decode(Double.self)
        minsPlayed = try container.decode(Int.self)
        fieldGoalsMade = try container.decode(Int.self)
        fieldGoalsAttempted = try container.decode(Int.self)
        fieldGoalPercentage = try container.decode(Double.self)
        fg3m = try container.decode(Int.self)
        fg3a = try container.decode(Int.self)
        fg3Percentage = try container.decode(Double.self)
        ftm = try container.decode(Int.self)
        tfa = try container.decode(Int.self)
        ftPercentage = try container.decode(Double.self)
        offensiveRebounds = try container.decode(Int.self)
        defensiveRebounds = try container.decode(Int.self)
        assists = try container.decode(Int.self)
        steals = try container.decode(Int.self)
        blocks = try container.decode(Int.self)
        turnovers = try container.decode(Int.self)
        personalFouls = try container.decode(Int.self)
        points = try container.decode(Int.self)
    }
}
