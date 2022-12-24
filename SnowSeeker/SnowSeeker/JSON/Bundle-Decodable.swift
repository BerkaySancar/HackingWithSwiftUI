//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 20.12.2022.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return decodedData
    }
}
