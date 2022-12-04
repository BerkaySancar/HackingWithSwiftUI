//
//  CoreDataManager.swift
//  Bookworm
//
//  Created by Berkay Sancar on 4.12.2022.
//

import CoreData
import Foundation

final class CoreDataManager: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { (description, error) in
            if let error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
