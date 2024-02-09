//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import Toast

extension UIViewController {
    func showToast(message: String) {
        var style = ToastStyle()
        style.backgroundColor = .white
        style.messageColor = .black
        
        self.view.makeToast(message, duration: 2, position: .top, style: style)
    }
}

