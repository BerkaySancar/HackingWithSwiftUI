//
//  MainViewModel.swift
//  Bucketlist
//
//  Created by Berkay Sancar on 9.12.2022.
//

import LocalAuthentication
import MapKit
import Foundation

extension MainView {
    
    @MainActor final class MainViewModel: ObservableObject {
        
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.97, longitude: 35.20), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations = [Location]() {
            didSet {
                save()
            }
        }
        @Published var selectedLocation: Location?
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavePlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
        }
        
        func update(location: Location) {
            guard let selectedLocation else { return }
            
            if let index = locations.firstIndex(of: selectedLocation) {
                locations[index] = location
            }
        }
        
        func authenticateFaceID() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                    
                    if success {
                        Task {
                            await MainActor.run {
                                self.isUnlocked = true
                            }
                        }
                    } else {
                        // handle error
                    }
                }
            } else {
                // handle error
            }
        }
    }
}
