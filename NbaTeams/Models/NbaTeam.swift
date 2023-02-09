//
//  Team.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import Foundation
import SwiftUI

struct NbaTeam: Hashable, Codable, Identifiable {
    var id: Int
    var abbreviation: String
    var teamName: String
    var simpleName: String
    var location: String
    var inFavourites: Bool
    
    var imageName: String
    
    var image : Image {
        Image(imageName)
    }
}

//func A() async throws {
//    try await loadNbaScoreboardData()
//}
