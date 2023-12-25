//
//  AuthResponse.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import Foundation

struct AuthResponse: Codable {
    let token: String
    let tokenLifetime: Int
}
