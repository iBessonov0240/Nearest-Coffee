//
//  RegistrationProtocols.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import Foundation

// Протокол для взаимодействия между Presenter и Interactor
protocol RegistrationInteractorInput: AnyObject {
    func register(email: String, password: String, confirmPassword: String)
}

// Протокол для взаимодействия между Interactor и Presenter
protocol RegistrationInteractorOutput: AnyObject {
    func registrationSuccess(response: Registration)
    func registrationFailure(error: Error)
}

// Протокол для взаимодействия между View и Presenter
protocol RegistrationViewInput: AnyObject {
    func showRegistrationSuccess(token: String)
    func showRegistrationFailure(error: String)
}

// Протокол для взаимодействия между Presenter и Router
protocol RegistrationRouterInput: AnyObject {
    func navigateToHome(token: String)
}
