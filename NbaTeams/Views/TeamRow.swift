//
//  TeamRow.swift
//  MyDemoApp
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct TeamRow: View {
    
    var team: NbaTeam
    
    var body: some View {
        HStack {
            team.image.resizable().frame(width: 80, height: 80)
            Text("\(team.teamName) (\(team.abbreviation))")
            Spacer()
            if team.inFavourites {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(team: ModelData().nbaTeams[0])
    }
}
