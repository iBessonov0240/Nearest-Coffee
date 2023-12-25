//
//  LoginInteractor.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

class LoginInteractor {

    weak var presenter: LoginPresenter?

    required init(presenter: LoginPresenter) {
        self.presenter = presenter
    }
}
