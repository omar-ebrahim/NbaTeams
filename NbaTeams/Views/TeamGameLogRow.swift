//
//  TeamGameLogRow.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 12/02/2023.
//

import SwiftUI

struct TeamGameLogRow: View {
    
    var teamGameLogDto: TeamGameLogDto
    
    var body: some View {
        
        
        VStack {
            
            
            Text("\(teamGameLogDto.gameDate): \(teamGameLogDto.matchup), \(teamGameLogDto.points)")

        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 80,
            maxHeight: 80,
            alignment: .center
        ).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple, lineWidth: 5)
        )
    }
}

struct TeamGameLogRow_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamGameLogRow(teamGameLogDto: TeamGameLogDto(teamId: 1, gameId: "0992423424", gameDate: "09/25/2022", matchup: "ATL @ WAS", winOrLoss: "W", points: 109))
    }
}
