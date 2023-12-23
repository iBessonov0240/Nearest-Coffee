//
//  UIView+Extensions.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
