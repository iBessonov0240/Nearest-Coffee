//
//  LocationResponse.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import Foundation

struct LocationResponse: Codable {
    let id: Int
    let name: String
    let point: Point
}
