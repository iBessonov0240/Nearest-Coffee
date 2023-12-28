//
//  CoffeeShopsProtocols.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import Foundation

// Протокол для взаимодействия между Presenter и Interactor
protocol CoffeeShopsInteractorInput: AnyObject {
    func fetchCoffeeShops()
}

// Протокол для взаимодействия между Interactor и Presenter
protocol CoffeeShopsInteractorOutput: AnyObject {
    func coffeeShopsFetched(coffeeShops: [LocationResponse])
    func coffeeShopsFetchFailed(error: Error)
}

// Протокол для взаимодействия между View и Presenter
protocol CoffeeShopsViewInput: AnyObject {
    func showCoffeeShops(coffeeShops: [LocationResponse])
    func showError(message: String)
}

// Протокол для взаимодействия между Presenter и Router
protocol CoffeeShopsRouterInput: AnyObject {
    func navigateToMap()
}

// Протокол для взаимодействия между Presenter и ячейкой таблицы
protocol CoffeeShopCellView: AnyObject {
    func displayCoffeeShop(name: String, imageURL: String, price: Int)
}

// Протокол для взаимодействия между Presenter и ячейкой таблицы
protocol CoffeeShopCellDelegate: AnyObject {
    // Можно добавить методы, если необходимо
}
