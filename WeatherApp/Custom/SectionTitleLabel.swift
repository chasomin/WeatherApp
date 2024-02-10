//
//  sectionTitleLabel.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

final class SectionTitleLabel: BaseView {
    let icon = UIImageView()
    let label = UILabel()
    
    override func configureHierarchy() {
        addSubview(icon)
        addSubview(label)
    }
    
    override func configureLayout() {
        icon.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview()
            
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(5)
            make.verticalEdges.equalToSuperview()
        }
    }
    
    override func configureView() {
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .lightGray
        
        label.textAlignment = .left
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
    }
}

