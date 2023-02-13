//
//  TeamDetail.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct TeamDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    // private state variables need to be initialised when declared to stop a build error
    @State private var bgColour: Color = .yellow
    @State private var teamGameLogs: [TeamGameLog] = [TeamGameLog]()
    @State private var isLoading = true
    
    var team: NbaTeam
    
    var teamIndex: Int {
        modelData.nbaTeams.firstIndex(where: {
            $0.id == team.id
        })!
    }
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(bgColour)
                .frame(height: 225)
                .ignoresSafeArea()
            
            RoundedSquareImage(image: team.image)
                .offset(y: -210)
                .frame(width: 180) // Don't need to specify height, as it'll scale
                .padding(.bottom, -210)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(team.teamName)
                        .font(.title)
                    Spacer()
                    FavouriteButton(isSet: $modelData.nbaTeams[teamIndex].inFavourites)
                }
                
                Divider()
                Text("2022 to 2023 season")
                Divider()
                
                if isLoading {
                    VStack(spacing: 15) {
                        Color.white // This is required so it's centred for some reason...
                        ProgressView()
                        Text("Loading game history…")
                    }
                } else {
                    ForEach(teamGameLogs) { teamGameLog in
                        NavigationLink {
                            TeamGame()
                        } label: {
                            let tglDto = TeamGameLogDto(
                                id: teamGameLog.id,
                                teamId: teamGameLog.teamId,
                                gameId: teamGameLog.gameId,
                                gameDate: teamGameLog.gameDate,
                                matchup: teamGameLog.matchup,
                                winOrLoss: teamGameLog.winOrLoss)
                            
                            TeamGameLogRow(teamGameLogDto: tglDto, borderColor: bgColour)
                        }.foregroundColor(Color(UIColor.label))
                    }
                }
            }
            .padding()
            .onAppear {
                Task {
                    let avgColour = (UIImage(named: team.imageName)?.averageColour) ?? .systemGray
                    bgColour = Color(avgColour)
                    do {
                        let data = try await getTeamGameLogs(teamId: team.id)
                        isLoading = false
                        data.forEach{ teamGamelog in
                            self.teamGameLogs.append(teamGamelog)
                        }
                    } catch {
                        print("ERROR: CANNOT PARSE: \(error)")
                    }
                }
            }
        }
        .navigationTitle(team.teamName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TeamDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail(team: ModelData().nbaTeams[1])
            .environmentObject(ModelData())
    }
}
