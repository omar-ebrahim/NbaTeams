//
//  TeamGame.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 12/02/2023.
//

import SwiftUI

struct TeamGame: View {
    
    var gameId: String
    var teamName: String
    
    @State private var gameInfo: [GameInfo] = [GameInfo]()
    @State private var lineScores: [LineScore] = [LineScore]() // there will be 2: home and visitor
    
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Scores")
                    .font(.title)
                
                Divider()
                
                if gameInfo.count > 0 { // required due to build error
                    let gData = gameInfo[0] // There will only be 1 record
                    
                    HStack {
                        Text("\(gData.gameDate)").font(.subheadline)
                        Spacer()
                    }
                    HStack {
                        Text("Game Time \(gData.gameTime)")
                        Spacer()
                    }
                    HStack {
                        Text("Attendance: \(gData.attendance)")
                        Spacer()
                    }
                }
                
                if (lineScores.count > 0){
                    let homeTeam = lineScores[0]
                    let awayTeam = lineScores[1]
                    
                    let homeOtTotal = homeTeam.pointsOvertime1 +
                    homeTeam.pointsOvertime2 +
                    homeTeam.pointsOvertime3 +
                    homeTeam.pointsOvertime4 +
                    homeTeam.pointsOvertime5 +
                    homeTeam.pointsOvertime6 +
                    homeTeam.pointsOvertime7 +
                    homeTeam.pointsOvertime8 +
                    homeTeam.pointsOvertime9 +
                    homeTeam.pointsOvertime10
                    
                    let awayOtTotal = awayTeam.pointsOvertime1 +
                    awayTeam.pointsOvertime2 +
                    awayTeam.pointsOvertime3 +
                    awayTeam.pointsOvertime4 +
                    awayTeam.pointsOvertime5 +
                    awayTeam.pointsOvertime6 +
                    awayTeam.pointsOvertime7 +
                    awayTeam.pointsOvertime8 +
                    awayTeam.pointsOvertime9 +
                    awayTeam.pointsOvertime10
                    
                    let homeTotal = homeTeam.pointsQuarter1 +
                    homeTeam.pointsQuarter2 +
                    homeTeam.pointsQuarter3 +
                    homeTeam.pointsQuarter4 +
                    homeOtTotal
                    
                    let awayTotal = awayTeam.pointsQuarter1 +
                    awayTeam.pointsQuarter2 +
                    awayTeam.pointsQuarter3 +
                    awayTeam.pointsQuarter4 +
                    awayOtTotal
                    
                    let homeWinner = homeTotal > awayTotal
                    
                    Divider()
                    
                    HStack {
                        
                        VStack {
                            
                            
                            
                            Text("\(homeTeam.teamCityName) \(homeTeam.teamNickName)")
                            
                            Divider()
                            
                            Text("Q1: \(homeTeam.pointsQuarter1)")
                            Text("Q2: \(homeTeam.pointsQuarter2)")
                            Text("Q3: \(homeTeam.pointsQuarter3)")
                            Text("Q4: \(homeTeam.pointsQuarter4)")
                            
                            Text("OT: \(homeOtTotal)")
                            Divider()
                            Text("Total: \(homeTotal)")
                            
                            if homeWinner {
                                Text("🏆")
                            } else {
                                Text("🏀")
                            }
                        }
                        Spacer()
                        VStack {
                            
                            Text("\(awayTeam.teamCityName) \(awayTeam.teamNickName)")
                            Divider()
                            
                            Text("Q1: \(awayTeam.pointsQuarter1)")
                            Text("Q2: \(awayTeam.pointsQuarter2)")
                            Text("Q3: \(awayTeam.pointsQuarter3)")
                            Text("Q4: \(awayTeam.pointsQuarter4)")
                            
                            Text("OT: \(awayOtTotal)")
                            Divider()
                            Text("Total: \(awayTotal)")
                            if !homeWinner {
                                Text("🏆")
                            } else {
                                Text("🏀")
                            }
                        }
                    }
                }
                
                
            }.padding()
            
            
            
            
        }
        .onAppear{
            Task {
                do {
                    let gameData = try await getLineScores(gameId: gameId)
                    gameInfo = gameData.gameInfo
                    lineScores = gameData.lineScores
                    
                    print(gameData.gameInfo)
                    print(gameData.lineScores)
                } catch {
                    
                }
            }
        }
        .navigationTitle(teamName)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct TeamGame_Previews: PreviewProvider {
    static var previews: some View {
        TeamGame(gameId: "0022200827", teamName: "TEST")
    }
}
