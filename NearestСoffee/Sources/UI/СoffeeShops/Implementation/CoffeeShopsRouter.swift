//
//  CoffeeShopsRouter.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import UIKit

class CoffeeShopsRouter: CoffeeShopsRouterInput {

    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
