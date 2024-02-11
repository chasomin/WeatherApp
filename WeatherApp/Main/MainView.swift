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
    
    let currentView = CurrentView()
    let threeHourView = ThreeHourIntervalView()
    let fiveDaysView = FiveDaysView()
    
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
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
        
        currentView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(contentView).offset(20)
        }
        
        threeHourView.snp.makeConstraints { make in
            make.top.equalTo(currentView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(300)
        }
        fiveDaysView.snp.makeConstraints { make in
            make.top.equalTo(threeHourView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(300)
            
        }
    }
    
    override func configureView() {
        backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height * 2)
    }
    
}
