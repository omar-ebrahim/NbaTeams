//
//  Scoreboard.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 07/02/2023.
//
// https://stackoverflow.com/questions/75383561/parse-decodable-struct-property-as-any-data-type/75384135#75384135

import Foundation

struct NbaJsonData: Decodable {
    var resultSets: [ResultSet]
}
