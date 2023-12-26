//
//  CoffeeShopsInteractor.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import UIKit

class CoffeeShopsInteractor: CoffeeShopsInteractorInput {

    weak var presenter: CoffeeShopsInteractorOutput?

    required init(presenter: CoffeeShopsInteractorOutput) {
        self.presenter = presenter
    }

    func fetchCoffeeShops() {
        
    }
}
