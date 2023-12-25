//
//  RegistrationModule.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

final class RegistrationModule {
    func makeModule() -> UIViewController {
        let viewController = RegistrationView()
        let presenter = RegistrationPresenter(view: viewController)
        let interactor = RegistrationInteractor(presenter: presenter)
        let router = RegistrationRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
