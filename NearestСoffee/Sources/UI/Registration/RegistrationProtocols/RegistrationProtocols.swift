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

}

// Протокол для взаимодействия между View и Presenter
protocol RegistrationViewInput: AnyObject {
   
}

protocol RegistrationViewOutput: AnyObject {
    
}

// Протокол для взаимодействия между Presenter и Router
protocol RegistrationRouterInput: AnyObject {
    func navigateToLogin()
}
