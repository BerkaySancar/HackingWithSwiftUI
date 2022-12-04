//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Berkay Sancar on 4.12.2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    @StateObject private var coreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
