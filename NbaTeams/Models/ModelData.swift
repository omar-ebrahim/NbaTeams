//
//  ModelData.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import Foundation
import Combine


final class ModelData : ObservableObject {
    @Published var nbaTeams: [NbaTeam] = loadJson("nbateams.json")
}

func loadJson<T: Decodable>(_ fileName: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Cannot find JSON file")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error loading contents of the JSON file.")
    }
    
    do {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: data)
    } catch {
        fatalError("Error parsing JSON file to \(T.self)\n\(error)")
    }
}

func getTeamGameLogs(teamId: Int) async throws -> [TeamGameLog] {
    
    // This will need to be retrieved from somewhere else, as this will change over time
    let season = "2022-23"
    
    let urlStr = "https://stats.nba.com/stats/teamgamelog?DateFrom=&DateTo=&LeagueID=00&Season=\(season)&SeasonType=Regular%20Season&TeamID=\(teamId)"
    let url = URL(string: urlStr)
    
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    request.setValue("stats.nba.com", forHTTPHeaderField: "host")
    request.setValue("https://www.nba.com/", forHTTPHeaderField: "Referer")
    request.setValue("https://www.nba.com", forHTTPHeaderField: "Origin")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    let (d, _) = try await URLSession.shared.data(for: request)
    let data = try (JSONDecoder().decode(NbaJsonData.self, from: d))
    
    let resultSet = data.resultSets[0]
    let teamGameLogs = resultSet.val() as? [TeamGameLog]
    return teamGameLogs ?? [TeamGameLog]() // Return an empty array if it was nil
    /*
     TODO:
     Use the game ID to call this URL https://stats.nba.com/stats/boxscoresummaryv2?GameID=0022200827 and then
     get the LineScores section of the JSON, as this will have the points total of the game
     */
}

