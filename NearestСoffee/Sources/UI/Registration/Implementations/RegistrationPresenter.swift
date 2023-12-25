//
//  RegistrationPresenter.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import UIKit

class RegistrationPresenter: RegistrationInteractorOutput {

    weak var view: RegistrationViewInput?
    var interactor: RegistrationInteractorInput?
    var router: RegistrationRouterInput?

    required init(view: RegistrationViewInput) {
        self.view = view
    }

    func register(email: String, password: String, confirmPassword: String) {
        interactor?.register(email: email, password: password, confirmPassword: confirmPassword)
    }

    func registrationSuccess(response: Registration) {
        view?.showRegistrationSuccess(token: response.token)
        router?.navigateToHome(token: response.token)
    }

    func registrationFailure(error: Error) {
        view?.showRegistrationFailure(error: error.localizedDescription)
    }

    func navigateToLoginTapped() {
        router?.navigateToLogin()
    }
}
