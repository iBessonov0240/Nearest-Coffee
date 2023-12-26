//
//  LoginRouter.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

class LoginRouter: LoginRouterInput {

    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToCoffeeShops() {
        let coffeeShopsModule = CoffeeShopsModule.makeModule()
        viewController?.navigationController?.pushViewController(coffeeShopsModule, animated: true)
    }
}
