//
//  RegistrationRouter.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import UIKit

class RegistrationRouter: RegistrationRouterInput {

    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToHome(token: String) {
        // Навигация к другому экрану
        // ...
    }

    func navigateToLogin() {
        let loginViewController = LoginModule().makeModule()
        viewController?.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
