//
//  MapView.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit
import YandexMapsMobile

class MapView: UIViewController, MapViewInput {

    // MARK: - Properties

    var presenter: MapPresenter?
    private lazy var mapObjectTapListener: YMKMapObjectTapListener = MapObjectTapListener(controller: self)

    // MARK: - Outlets

    private lazy var mapView: YMKMapView = {
        let map = YMKMapView()
        return map
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = YMKMapView(frame: view.frame)
        setupNavigationBar()
        setupMap()
        addCoffeeShops()
        moveMapToDefaultLocation()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = "Карта"
        navigationController?.navigationBar.backgroundColor = Theme.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.lightBrownColor]
        navigationController?.navigationBar.tintColor = Theme.lightBrownColor
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // Открытие карты в определенной точке
    private func setupMap() {
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: YMKPoint(latitude: 59.935693, longitude: 30.327992),
                zoom: 15,
                azimuth: 0,
                tilt: 0
            ),
            animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }

    // Изменение масштаба и угла на карте
    private func move(_ map: YMKMap, to point: YMKPoint) {
        let cameraPosition = YMKCameraPosition(target: point, zoom: 17.0, azimuth: 150.0, tilt: 30.0)

        map.move(with: cameraPosition, animation: YMKAnimation(type: .smooth, duration: 1.0))
    }

    private func moveMapToDefaultLocation() {
        move(mapView.mapWindow.map, to: YMKPoint(latitude: 59.935693, longitude: 30.327992))
    }

    // Добавление точек магазинов кофе на карту
    private func addCoffeeShops() {
        // Заменить данные точек с бэка
        let coffeeShopLocations: [YMKPoint] = [
            YMKPoint(latitude: 59.935399, longitude: 30.327992),
            YMKPoint(latitude: 59.935693, longitude: 30.329292),
            YMKPoint(latitude: 59.936393, longitude: 30.327492),
            YMKPoint(latitude: 59.934793, longitude: 30.328592),
            YMKPoint(latitude: 59.934993, longitude: 30.327092)
        ]

        for location in coffeeShopLocations {
            addCoffeeShopMarker(at: location)
        }
    }

    // Установка картинки на карте
    private func addCoffeeShopMarker(at location: YMKPoint) {
        let placemark = mapView.mapWindow.map.mapObjects.addPlacemark()

        placemark.geometry = location

        if let iconImage = UIImage(named: "coffeeShop") {
            placemark.setIconWith(iconImage)
            addPlacemark(mapView.mapWindow.map, for: placemark)
        } else {
            placemark.setIconWith(UIImage())
        }
    }

    // Установка обработчика нажатий на метки
    private func addPlacemark(_ map: YMKMap, for placemark: YMKPlacemarkMapObject) {
        placemark.addTapListener(with: mapObjectTapListener)
    }

    private func setupHierarchy() {
        view.addSubview(mapView)
    }

    private func setupLayout() {

    }

    // MARK: - Actions
}
