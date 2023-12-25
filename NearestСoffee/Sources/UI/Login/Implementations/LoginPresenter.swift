//
//  LoginPresenter.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

class LoginPresenter {

    weak var view: LoginView?
    var interactor: LoginInteractor?
    var router: LoginRouter?
    
    required init(view: LoginView) {
        self.view = view
    }
}
