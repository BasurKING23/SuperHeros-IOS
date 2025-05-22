//
//  SuperheroResponse.swift
//  SuperHeros-IOS
//
//  Created by Mañanas on 22/5/25.
//


import Foundation

struct SuperheroResponse : Codable {
    let results: [Superhero]
}

struct Superhero : Codable {
    let id: String
    let name: String
    let image: Image
    let biography: Biography
}

struct Image : Codable {
    let url: String
}

struct Biography : Codable {
    let realName: String
    let placeOfBirth: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
        case publisher, alignment
    }
}
