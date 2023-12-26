//
//  LoginProtocols.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import Foundation

// Protocol for communication from View to Presenter
protocol LoginViewInput: AnyObject {
    
}

// Protocol for communication from Presenter to View
protocol LoginViewOutput: AnyObject {
    func loginButtonPressed()
}

// Protocol for communication from Presenter to Interactor
protocol LoginInteractorInput: AnyObject {
    func performLogin()
}

// Protocol for communication from Interactor to Presenter
protocol LoginInteractorOutput: AnyObject {
    func loginSuccess()
}

// Protocol for communication from Presenter to Router
protocol LoginRouterInput: AnyObject {
    func navigateToCoffeeShops()
}
