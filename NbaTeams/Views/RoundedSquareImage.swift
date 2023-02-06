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
        
        //.background(in: RoundedRectangle(cornerRadius: 50).fill(.blue))
        ZStack {
            
            image
                .resizable()
                .scaledToFit()
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 35))
                .shadow(radius: 9)
                
                //.background(RoundedRectangle(cornerRadius: 50).fill(.blue).opacity(0.7))
                //.blur(radius: 50)
        }
        
            
    }
    
}

struct SquircleImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSquareImage(image: Image("minnesota_timberwolves"))
    }
}

