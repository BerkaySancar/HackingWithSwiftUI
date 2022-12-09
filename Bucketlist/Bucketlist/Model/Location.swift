//
//  Location.swift
//  Bucketlist
//
//  Created by Berkay Sancar on 9.12.2022.
//

import CoreLocation
import Foundation

struct Location: Identifiable, Equatable, Codable {
    
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
