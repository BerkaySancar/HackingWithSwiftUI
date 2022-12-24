//
//  FavoriteManager.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 24.12.2022.
//

import Foundation

final class Favorites: ObservableObject {
    
    private var resorts: Set<String> {
        didSet {
            save()
        }
    }
    private let saveKey = "Favorites"
    
    init() {
        resorts = []
        getFavorites()
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
    }
    
    func remove(resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
    }
    
    func getFavorites() {
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let savedResorts = try? JSONDecoder().decode(Set<String>.self, from: data)
        else { return }
        
        self.resorts = savedResorts
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}

