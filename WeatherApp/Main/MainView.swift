//
//  MainView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

final class MainView: BaseView {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let backgroundImageView = UIImageView()
    
    let currentView = CurrentView()
    let threeHourView = ThreeHourIntervalView()
    let fiveDaysView = FiveDaysView()
    
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(backgroundImageView)
        
        contentView.addSubview(currentView)
        contentView.addSubview(threeHourView)
        contentView.addSubview(fiveDaysView)

    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1000)  // 높이 지정 필요??
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        currentView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(contentView)
        }
        
        threeHourView.snp.makeConstraints { make in
            make.top.equalTo(currentView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(300)
        }
        fiveDaysView.snp.makeConstraints { make in
            make.top.equalTo(threeHourView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(300)
            
        }
    }
    
    override func configureView() {
        backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height * 2)
        
        backgroundImageView.kf.setImage(with: URL(string: "https://images.pexels.com/photos/695657/pexels-photo-695657.jpeg?auto=compress&cs=tinysrgb&w=1200"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.8
    }
    
}
