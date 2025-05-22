//
//  SuperheroProvider.swift
//  SuperHeros-IOS
//
//  Created by Mañanas on 21/5/25.
//

import Foundation

class SuperheroProvider {
    
    static let API_KEY = "7606f1c6a2b57ea22ca4bdf432bd1f9c"
    
    static func findSuperheroesByName(query: String) async -> [Superhero] {
        let url = URL(string: "https://www.superheroapi.com/api.php/\(API_KEY)/search/\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
            
            return result.results
        } catch {
            print(error)
            return []
        }
    }
    
}
 
