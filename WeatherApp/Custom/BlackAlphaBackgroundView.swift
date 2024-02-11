//
//  BlackAlphaBackgroundView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/12/24.
//

import UIKit

class BlackAlphaBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        layer.cornerRadius = 15
        alpha = 0.3

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
