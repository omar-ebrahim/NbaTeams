//
//  ModelData.swift
//  MyDemoApp
//
//  Created by Omar Ebrahim on 05/02/2023.
//

import Foundation
import Combine


final class ModelData : ObservableObject {
    @Published var nbaTeams: [NbaTeam] = loadJson("nbateams.json")
}

func loadJson<T: Decodable>(_ fileName: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Cannot find JSON file")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error loading contents of the JSON file.")
    }
    
    do {
        let jsonDecoder = JSONDecoder()
                return try jsonDecoder.decode(T.self, from: data)
    } catch {
        fatalError("Error parsing JSON file to \(T.self)\n\(error)")
    }
}
