//
//  FavouriteButton.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct FavouriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button { isSet.toggle() } label: {
            if (isSet) {
                Label("", systemImage: "star.slash")
            } else {
                Label("", systemImage: "star")
            }
        }
        .font(.system(size: 30))
        .tint(isSet ? .red : .yellow)
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(isSet: .constant(true))
    }
}
