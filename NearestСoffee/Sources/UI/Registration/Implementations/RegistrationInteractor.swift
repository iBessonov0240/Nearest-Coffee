//
//  RegistrationInteractor.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import UIKit

class RegistrationInteractor: RegistrationInteractorInput {
    
    weak var presenter: RegistrationInteractorOutput?

    required init(presenter: RegistrationInteractorOutput) {
        self.presenter = presenter
    }

    func register(email: String, password: String, confirmPassword: String) {
        // Отправка запроса на сервер
        guard let url = URL(string: "http://147.78.66.203:3210/auth/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            presenter?.registrationFailure(error: error)
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let registrationResponse = try decoder.decode(Registration.self, from: data)
                    self.presenter?.registrationSuccess(response: registrationResponse)
                } catch {
                    self.presenter?.registrationFailure(error: error)
                }
            } else if let error = error {
                self.presenter?.registrationFailure(error: error)
            }
        }.resume()
    }
}
