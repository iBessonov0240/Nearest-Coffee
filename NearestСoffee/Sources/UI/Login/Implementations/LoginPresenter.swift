//
//  LoginPresenter.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import Foundation

class LoginPresenter: LoginInteractorOutput {

    weak var view: LoginViewInput?
    var interactor: LoginInteractorInput?
    var router: LoginRouterInput?

    required init(view: LoginViewInput) {
        self.view = view
    }

    func loginButtonPressed() {
        interactor?.performLogin()
    }

    func loginSuccess() {
        router?.navigateToCoffeeShops()
    }
}
