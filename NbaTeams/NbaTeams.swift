//
//  NbaTeams.swift
//  NbaTeams
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import SwiftUI

@main
struct NbaTeams: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
