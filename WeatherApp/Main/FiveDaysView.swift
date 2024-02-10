//
//  FiveDaysView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

class FiveDaysView: BaseView {
    
    let title = SectionTitleLabel()
    let tableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(title)
        addSubview(tableView)
    }
    
    override func configureLayout() {
        title.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview().inset(5)
            make.top.equalTo(title.snp.bottom).offset(5)
            make.height.equalTo(500)
        }
    }
    
    override func configureView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        
        title.label.text = "5일"
        
        tableView.backgroundColor = .red
    }
}
