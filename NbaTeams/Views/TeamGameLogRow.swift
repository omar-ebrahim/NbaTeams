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
        VStack {
            
            let borderRadius: CGFloat = 20
            
            Text("\(teamGameLogDto.gameDate): \(teamGameLogDto.matchup), \(teamGameLogDto.points)")
                .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 80,
                        maxHeight: 80,
                        alignment: .center)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: borderRadius))
                    .overlay(RoundedRectangle(cornerRadius: borderRadius).stroke(borderColor, lineWidth: 3))
        }
    }
}

struct TeamGameLogRow_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamGameLogRow(teamGameLogDto: TeamGameLogDto(id: UUID(), teamId: 1, gameId: "0992423424", gameDate: "09/25/2022", matchup: "ATL @ WAS", winOrLoss: "W", points: 109), borderColor: .black)
    }
}
