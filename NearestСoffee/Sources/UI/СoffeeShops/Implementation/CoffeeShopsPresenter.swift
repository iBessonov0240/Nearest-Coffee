//
//  CoffeeShopsPresenter.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import UIKit

class CoffeeShopsPresenter: CoffeeShopsInteractorOutput {

    weak var view: CoffeeShopsViewInput?
    var interactor: CoffeeShopsInteractorInput?
    var router: CoffeeShopsRouterInput?

    required init(view: CoffeeShopsViewInput) {
        self.view = view
    }

    func viewDidLoad() {
        interactor?.fetchCoffeeShops()
    }

    // Реализация методов CoffeeShopsInteractorOutput
    func coffeeShopsFetched(coffeeShops: [LocationResponse]) {
        view?.showCoffeeShops(coffeeShops: coffeeShops)
    }

    func coffeeShopsFetchFailed(error: Error) {
        view?.showError(message: "Failed to fetch coffee shops")
    }

    func mapButtonPressed() {
        router?.navigateToMap()
    }
}
