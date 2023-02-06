//
//  TeamDetail.swift
//  MyDemoApp
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct TeamDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var team: NbaTeam
    
    var teamIndex: Int {
        modelData.nbaTeams.firstIndex(where: {
            $0.id == team.id
        })!
    }
    
    var body: some View {
        
        ScrollView {
            Rectangle()
                .fill(.yellow)
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
                
            }.padding()
            
           
            
            
        }
        .navigationTitle(team.teamName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TeamDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail(team: ModelData().nbaTeams[6])
            .environmentObject(ModelData())
    }
}
