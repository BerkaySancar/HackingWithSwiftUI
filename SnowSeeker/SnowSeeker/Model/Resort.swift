//
//  Resort.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 20.12.2022.
//

import Foundation

struct Resort: Codable, Identifiable {
    
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    static let resorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = resorts[0]
}
