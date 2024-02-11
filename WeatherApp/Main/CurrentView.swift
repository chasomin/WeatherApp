//
//  CurrentView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

final class CurrentView: BaseView {
    let cityLabel = UILabel()
    let currentTempLabel = UILabel()
    let descriptionLabel = UILabel()
    let maxMinTemp = UILabel()
    
    override func configureHierarchy() {
        addSubview(cityLabel)
        addSubview(currentTempLabel)
        addSubview(descriptionLabel)
        addSubview(maxMinTemp)
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        currentTempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom).offset(5)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentTempLabel.snp.bottom).offset(5)
        }
        maxMinTemp.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        cityLabel.font = .boldSystemFont(ofSize: 20)
        cityLabel.textAlignment = .center
        cityLabel.textColor = .white
        
        currentTempLabel.font = .boldSystemFont(ofSize: 30)
        currentTempLabel.textAlignment = .center
        currentTempLabel.textColor = .white
        
        descriptionLabel.font = .boldSystemFont(ofSize: 17)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        
        maxMinTemp.font = .boldSystemFont(ofSize: 17)
        maxMinTemp.textAlignment = .center
        maxMinTemp.textColor = .white

        
        cityLabel.text = "도봉구"
        currentTempLabel.text = "10"
        descriptionLabel.text = "맑음"
        maxMinTemp.text = "최고최저"
    }
    
    func setData(data: CurrentWeather) {
        cityLabel.text = data.name
        guard let main = data.main else { return }
        currentTempLabel.text = "\(main.temp)"
        descriptionLabel.text = data.weather.first?.main
        maxMinTemp.text = "\(main.tempMax) | \(main.tempMin)"
    }
}
