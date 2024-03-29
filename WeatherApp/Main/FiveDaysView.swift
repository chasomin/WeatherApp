//
//  FiveDaysView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

final class FiveDaysView: BaseView {
    let backgroundView = BlackAlphaBackgroundView()
    
    let title = SectionTitleLabel()
    let divider = DividerView()
    let tableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(backgroundView)
        addSubview(title)
        addSubview(divider)
        addSubview(tableView)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
        divider.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(5)
            make.top.equalTo(title.snp.bottom).offset(5)
            make.height.equalTo(1)
        }

        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview().inset(5)
            make.top.equalTo(divider.snp.bottom).offset(5)
            make.height.equalTo(500)
        }
    }
    
    override func configureView() {

        tableView.rowHeight = 50
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        
        title.icon.image = UIImage(systemName: "calendar")
        title.label.text = "5일간의 일기예보"
        
        
    }
}
