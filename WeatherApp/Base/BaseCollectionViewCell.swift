//
//  BaseCollectionViewCell.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ConfigureUI {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear

        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
        
    }
    
    
}
