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
    @Published var scoreboardData: Scoreboard = loadNbaScoreboardData()
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

func loadNbaScoreboardData() -> Scoreboard {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    let formattedDate = formatter.string(from: Date())
    
    let url = URL(string: "https://stats.nba.com/stats/scoreboard/?GameDate=\(formattedDate)&LeagueID=00&DayOffset=-100")
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    request.setValue("stats.nba.com", forHTTPHeaderField: "host")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("stats", forHTTPHeaderField: "x-nba-stats-origin")
    request.setValue("x-nba-stats-origin", forHTTPHeaderField: "Referer")
    
    var retData1: Scoreboard = Scoreboard(resultSets: [ResultSet]())
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else { return }
        //let str = String(decoding: data, as: UTF8.self)
        //var d = Data(contentsOf: data)
        
        let retData: Scoreboard
        do {
            retData = try (JSONDecoder().decode(Scoreboard.self, from: data))
            //retData = decodedData
            retData1 = retData
        } catch {
            print("Error loading JSON: \(error.localizedDescription)")
        }
    }.resume()
    
    return retData1
}

