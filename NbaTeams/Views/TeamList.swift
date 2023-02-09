//
//  TeamsList.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct TeamList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredTeams: [NbaTeam] {
        modelData.nbaTeams.filter{ team in
            (!showFavoritesOnly || team.inFavourites)
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favourites only")
                }
                
                ForEach(filteredTeams) { team in
                    NavigationLink {
                        TeamDetail(team: team)
                    } label: {
                        TeamRow(team: team)
                    }
                    .swipeActions {
                        let index = modelData.nbaTeams.firstIndex(where:{ $0.id == team.id})!
                        
                        FavouriteButton(isSet: $modelData.nbaTeams[index].inFavourites)
                        
                        
                    }
                }
                .navigationTitle("Teams")
                
            }
        }
    }
}

struct TeamsList_Previews: PreviewProvider {
    static var previews: some View {
        TeamList()
            .environmentObject(ModelData())
    }
}
