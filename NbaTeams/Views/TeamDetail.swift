//
//  TeamDetail.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct TeamDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var bgColour: Color = .yellow
    
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
            }
            .padding()
            .onAppear {
                let avgColour = (UIImage(named: team.imageName)?.averageColour) ?? .systemGray
                bgColour = Color(avgColour)
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
