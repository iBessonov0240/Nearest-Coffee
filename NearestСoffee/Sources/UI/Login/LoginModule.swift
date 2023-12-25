//
//  LoginModule.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

import UIKit

final class LoginModule {
    func makeModule() -> UIViewController {
        let viewController = LoginView()
        let presenter = LoginPresenter(view: viewController)
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
