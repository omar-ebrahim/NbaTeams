//
//  Scoreboard.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 07/02/2023.
//
// https://stackoverflow.com/questions/75383561/parse-decodable-struct-property-as-any-data-type/75384135#75384135

import Foundation

enum ResultSet: Decodable {
    case lastMeeting([LastMeeting])
    case string([String]) // A catch-all for arrays we don't need.
    
    enum CodingKeys: CodingKey {
        case name
        case headers
        case rowSet
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decoding must be done in the order the data arrives
        // 1, "two" => Int.self, String.self... etc.
        let name = try container.decode(String.self, forKey: .name)
        _ = try container.decode([String].self, forKey: .headers)
        // rowSet can be any type, but the type is inferred from the resouce "name".
        // We don't want it to throw, so for now, set an empty array for everything else
        switch name {
        case "GameHeader", "LineScore", "SeriesStandings", "EastConfStandingsByDay", "WestConfStandingsByDay", "Available":
            self = .string([String]()) // Set an empty array, we don't need them yet
        case "LastMeeting":
            // Decode it as a LastMeeting object
            self = .lastMeeting(try container.decode([LastMeeting].self, forKey: .rowSet))
        default:
            // Nothing to parse
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Unknown resource name \(name)"))
        }
    }
}

struct Scoreboard: Decodable {
    var resultSets: [ResultSet]
}

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
