//
//  FiveDaysTableViewCell.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import Kingfisher

class FiveDaysTableViewCell: BaseTableViewCell {
    let dayLabel = UILabel()
    let iconImageView = UIImageView()
    let minTempLabel = UILabel()
    let maxTempLabel = UILabel()
    
    override func configureHierarchy() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(minTempLabel)
        contentView.addSubview(maxTempLabel)
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.verticalEdges.equalToSuperview().inset(5)
            make.width.equalTo(100)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalTo(dayLabel.snp.trailing).offset(10)
            make.verticalEdges.equalToSuperview().inset(5)
            make.width.equalTo(30)
        }
        
        minTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.verticalEdges.equalToSuperview().inset(5)
            make.width.equalTo(70)
        }
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempLabel.snp.trailing).offset(10)
            make.verticalEdges.equalToSuperview().inset(5)
            make.width.equalTo(70)
            make.trailing.equalToSuperview().priority(.required)
        }

    }
    
    override func configureView() {
        backgroundColor = .clear
        dayLabel.textColor = .white
        dayLabel.textAlignment = .left
        dayLabel.font = .boldSystemFont(ofSize: 15)
        
        iconImageView.contentMode = .scaleAspectFit
        
        minTempLabel.textColor = .lightGray
        minTempLabel.textAlignment = .center
        minTempLabel.font = .boldSystemFont(ofSize: 15)
        
        maxTempLabel.textColor = .white
        maxTempLabel.textAlignment = .center
        maxTempLabel.font = .boldSystemFont(ofSize: 15)

    }
    
    func configureCell(data: FiveDayWeather, index: Int) {
        let result = data.list[index]
        dayLabel.text = result.dt_txt
        iconImageView.kf.setImage(with: URL(string: result.weather.first?.icon ?? ""))
        maxTempLabel.text = "\(result.main.tempMax)"
        minTempLabel.text = "\(result.main.tempMax)"

    }
}
