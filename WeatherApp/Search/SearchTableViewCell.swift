//
//  SearchTableViewCell.swift
//  WeatherApp
//
//  Created by 차소민 on 2/13/24.
//

import UIKit
import SnapKit

final class SearchTableViewCell: BaseTableViewCell {
    
    let icon = UIImageView()
    let cityNameLabel = UILabel()
    let countryNameLabel = UILabel()
    

    override func configureHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(countryNameLabel)
    }
    
    override func configureLayout() {
        icon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.height.width.equalTo(25)
            
        }
        
        cityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(10)
            make.top.equalTo(icon)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        countryNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(cityNameLabel)
            make.top.equalTo(cityNameLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(15)
        }
    }

    override func configureView() {
        selectionStyle = .none
        
        icon.image = UIImage(systemName: "number")
        icon.tintColor = .white
        
        cityNameLabel.textAlignment = .left
        cityNameLabel.textColor = .white
        
        countryNameLabel.textAlignment = .left
        countryNameLabel.textColor = .lightGray
    }
    
    func configureCell(data: [City], index: Int) {
        cityNameLabel.text = data[index].name
        countryNameLabel.text = data[index].country
    }
}
