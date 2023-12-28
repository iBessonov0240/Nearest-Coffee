//
//  MapInteractor.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit

class MapInteractor: MapInteractorInput {

    weak var presenter: MapInteractorOutput?

    required init(presenter: MapInteractorOutput) {
        self.presenter = presenter
    }
}
