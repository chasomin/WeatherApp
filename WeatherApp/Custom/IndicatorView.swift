//
//  IndicatorView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit

final class IndicatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
