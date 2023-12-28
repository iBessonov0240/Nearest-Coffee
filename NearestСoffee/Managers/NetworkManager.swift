//
//  NetworkManager.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func loginUser(loginData: LoginData, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        // Реализация запроса на вход пользователя
    }

    func registerUser(loginData: LoginData, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        // Реализация запроса на регистрацию пользователя
    }

    func getLocations(completion: @escaping (Result<[LocationResponse], Error>) -> Void) {
        // Реализация запроса на получение ближайших кофеен
    }

    func getMenuForLocation(locationID: Int, completion: @escaping (Result<[LocationResponse], Error>) -> Void) {
        // Реализация запроса на получение меню для конкретной локации
    }
}
