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
    var homeGame: Bool
    
    @State private var gameInfo: [GameInfo] = [GameInfo]()
    @State private var lineScores: [LineScore] = [LineScore]() // there will be 2: home and visitor
    
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Scores").font(.title)
                
                Divider()
                
                if gameInfo.count > 0 { // required due to build error
                    let gData = gameInfo[0] // There will only be 1 record
                    Group {
                        Spacer().frame(height: 10)
                        Text("\(gData.gameDate)").font(.subheadline)
                        HStack {
                            Text("\(homeGame ? "🏠" : "🛫")")
                            Spacer().frame(width: 20)
                            Text("⏱️ \(gData.gameTime)")
                            Spacer().frame(width: 20)
                            Text("👥 \(gData.attendance)")
                        }
                        .padding()
                    }.padding(3)
                }
                
                Spacer().frame(height: 20)
                
                if lineScores.count > 0 {
                    
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
                    
                    Spacer().frame(height: 20)
                    
                    let homeColour = getTeamUIImageAverageColour(homeTeam.teamId)
                    
                    Group {
                        VStack {
                            HStack {
                                getTeamImage(homeTeam.teamId).resizable().aspectRatio(contentMode: .fit).frame(width: 90)
                                Spacer()
                                Text("\(homeTeam.teamCityName) \(homeTeam.teamNickName)").font(.headline)
                                Spacer()
                                Text("\(homeTotal)")
                                if homeWinner { Text("🏆") } else { Text("🏀") }
                            }.padding(10)
                            
                            HStack {
                                Text("⏳ Q1: \(homeTeam.pointsQuarter1), Q2: \(homeTeam.pointsQuarter2), Q3: \(homeTeam.pointsQuarter3), Q4: \(homeTeam.pointsQuarter4)")
                                Spacer()//.frame(width: 30)
                                Text("⌛️ OT: \(homeOtTotal)")
                            }.padding(10)
                        }
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(homeColour, lineWidth: 3))
                    }
                    
                    Spacer().frame(height: 20)
                    
                    let awayColour = getTeamUIImageAverageColour(awayTeam.teamId)
                    
                    Group {
                        VStack {
                            HStack {
                                let awayTeamImage = getTeamImage(awayTeam.teamId)
                                
                                awayTeamImage.resizable().aspectRatio(contentMode: .fit).frame(width: 90)
                                Spacer()
                                Text("\(awayTeam.teamCityName) \(awayTeam.teamNickName)").font(.headline)
                                Spacer()
                                Text("\(awayTotal)")
                                if !homeWinner { Text("🏆") } else { Text("🏀") }
                            }.padding(10)
                            
                            HStack {
                                Text("⏳ Q1: \(awayTeam.pointsQuarter1), Q2: \(awayTeam.pointsQuarter2), Q3: \(awayTeam.pointsQuarter3), Q4: \(awayTeam.pointsQuarter4)")
                                Spacer()//.frame(width: 30)
                                Text("⌛️ OT: \(awayOtTotal)")
                            }
                            .padding(10)
                        }
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(awayColour, lineWidth: 3))
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
                } catch {
                    print("Couldn't get line scores...")
                }
            }
        }
        .navigationTitle(teamName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TeamGame_Previews: PreviewProvider {
    static var previews: some View {
        TeamGame(gameId: "0022200827", teamName: "TEST", homeGame: true)
    }
}
