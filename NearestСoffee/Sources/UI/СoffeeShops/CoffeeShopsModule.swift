//
//  CoffeeShopsModule.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import UIKit

final class CoffeeShopsModule {
    static func makeModule() -> UIViewController {
        let viewController = CoffeeShopsView()
        let presenter = CoffeeShopsPresenter(view: viewController)
        let interactor = CoffeeShopsInteractor(presenter: presenter)
        let router = CoffeeShopsRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
