//
//  SquircleImage.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

struct RoundedSquareImage: View {
    var image: Image
    var body: some View {
        ZStack {
            image
                .resizable()
                .scaledToFit()
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 35))
                .shadow(radius: 9)
        }
    }
}

struct SquircleImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSquareImage(image: Image("minnesota_timberwolves"))
    }
}

