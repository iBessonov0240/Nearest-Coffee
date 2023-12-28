//
//  MapObjectTapListeners.swift
//  NearestСoffee
//
//  Created by i0240 on 27.12.2023.
//

import YandexMapsMobile

final class MapObjectTapListener: NSObject, YMKMapObjectTapListener {
    init(controller: UIViewController) {
        self.controller = controller
    }

    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        let alertController = UIAlertController(
            title: "Tapped point",
            message: "\(point.latitude), \(point.longitude)",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        controller.present(alertController, animated: true, completion: nil)

        return true
    }

    private let controller: UIViewController
}

