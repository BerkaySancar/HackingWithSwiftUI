//
//  Card.swift
//  Flashzilla
//
//  Created by Berkay Sancar on 13.12.2022.
//

import Foundation

struct Card: Codable {
    
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "ASDFGHJ", answer: "1234")
}
