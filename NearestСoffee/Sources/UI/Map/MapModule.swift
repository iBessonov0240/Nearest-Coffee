//
//  MapModule.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit

final class MapModule {
    static func makeModule() -> UIViewController {
        let viewController = MapView()
        let presenter = MapPresenter(view: viewController)
        let interactor = MapInteractor(presenter: presenter)
        let router = MapRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
