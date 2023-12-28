//
//  MapPresenter.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit

class MapPresenter: MapInteractorOutput {

    weak var view: MapViewInput?
    var interactor: MapInteractorInput?
    var router: MapRouterInput?

    required init(view: MapViewInput) {
        self.view = view
    }
}
