//
//  TeamGameLogRow.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 12/02/2023.
//

import SwiftUI

struct TeamGameLogRow: View {
    
    var teamGameLogDto: TeamGameLogDto
    var borderColor: Color
    
    @State private var fontColour: Color = Color.white
    
    var body: some View {
        let borderRadius: CGFloat = 20
        
        let matchup = getLineUp(lineup: teamGameLogDto.matchup)
        
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(teamGameLogDto.gameDate)").bold()
                    Divider()
                    Text("\(matchup.againstTeam)")
                }
                
                Spacer(minLength: 10)
                Text("\(matchup.homeOrAway == "H" ? "🏠" : "🛫")")
                
                Spacer(minLength: 10)
                VStack {
                    Text(teamGameLogDto.winOrLoss == "W" ? "🏆" : "🏀")
                    Text("\(teamGameLogDto.points)")
                }
            }
            .font(.title2)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, alignment: .center)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: borderRadius))
            .overlay(RoundedRectangle(cornerRadius: borderRadius).stroke(borderColor, lineWidth: 3))
          
    }
}

struct TeamGameLogRow_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamGameLogRow(teamGameLogDto: TeamGameLogDto(id: UUID(), teamId: 1, gameId: "0992423424", gameDate: "Feb 11, 2023", matchup: "ATL vs. WAS", winOrLoss: "W", points: 109), borderColor: .black)
    }
}
