//
//  Point.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import Foundation
import CoreLocation

struct Point: Codable {
    let latitude: Double
    let longitude: Double

    func distance(to location: CurrentLocation) -> CLLocationDistance {
        let coordinate1 = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let coordinate2 = CLLocation(latitude: location.latitude, longitude: location.longitude)
        return coordinate1.distance(from: coordinate2) / 1000
    }
}
