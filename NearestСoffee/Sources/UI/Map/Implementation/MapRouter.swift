//
//  MapRouter.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit

class MapRouter: MapRouterInput {

    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
