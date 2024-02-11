//
//  ThreeHourCollectionViewCell.swift
//  WeatherApp
//
//  Created by 차소민 on 2/10/24.
//

import UIKit
import SnapKit

final class ThreeHourCollectionViewCell: BaseCollectionViewCell {
    let hourLabel = UILabel()
    let iconImageView = UIImageView()
    let tempLabel = UILabel()
    
    override func configureHierarchy() {
        contentView.addSubview(hourLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
    }
    
    override func configureLayout() {
        hourLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(5)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(hourLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(5)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom)
            make.bottom.horizontalEdges.equalToSuperview().inset(5)
        }
    }
    
    override func configureView() {
        backgroundColor = .clear
        
        hourLabel.textAlignment = .center
        hourLabel.font = .systemFont(ofSize: 13)
        hourLabel.textColor = .white
        
        iconImageView.contentMode = .scaleAspectFit
        
        tempLabel.textAlignment = .center
        tempLabel.font = .systemFont(ofSize: 13)
        tempLabel.textColor = .white
        
        
        //test
        hourLabel.text = "12시"
        iconImageView.image = UIImage(systemName: "star")
        tempLabel.text = "0도"
        
    }
}
