//
//  ThreeHourIntervalView.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import SnapKit

final class ThreeHourIntervalView: BaseView {
    let title = SectionTitleLabel()
    let indicator = IndicatorView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        
        layout.itemSize = CGSize(width: 100, height: 200)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    override func configureHierarchy() {
        addSubview(title)
        addSubview(indicator)
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        title.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.horizontalEdges.top.equalTo(safeAreaLayoutGuide).inset(5)
        }
        
        indicator.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(5)
            make.top.equalTo(title.snp.bottom).offset(5)
            make.height.equalTo(1)
        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview().inset(5)
            make.height.equalTo(200)
            make.top.equalTo(indicator.snp.bottom).offset(5)
        }
    }
    
    override func configureView() {
        
        collectionView.backgroundColor = .clear
        
        
        title.label.text = "3시간 간격 날씨"
        title.icon.image = UIImage(systemName: "calendar")
    }
}
