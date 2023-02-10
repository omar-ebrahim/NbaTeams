//
//  ResultSet.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 10/02/2023.
//

import Foundation

enum ResultSet: Decodable {
    case lastMeeting([LastMeeting])
    case lineScore([LineScore])
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
        case "GameHeader",
            "SeriesStandings",
            "EastConfStandingsByDay",
            "WestConfStandingsByDay",
            "Available",
            "TeamGameLog",
            "GameSummary",
            "OtherStats",
            "Officials",
            "InactivePlayers",
            "GameInfo",
            "SeasonSeries",
            "AvailableVideo":
            self = .string([String]()) // Set an empty array, we don't need them yet
            
        case "LineScore":
            self = .lineScore(try container.decode([LineScore].self, forKey: .rowSet))
            
        case "LastMeeting":
            // Decode it as a LastMeeting object
            self = .lastMeeting(try container.decode([LastMeeting].self, forKey: .rowSet))
            
        default:
            // Nothing to parse
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Unknown resource name \(name)"))
        }
    }
}

