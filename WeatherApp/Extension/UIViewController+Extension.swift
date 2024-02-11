//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import Toast

extension UIViewController {
    func showToast(message: String) {
        var style = ToastStyle()
        style.backgroundColor = .white
        style.messageColor = .black
        
        self.view.makeToast(message, duration: 2, position: .top, style: style)
    }
}


extension UIViewController {
    func setTableView(tableView: UITableView, delegate: UITableViewDelegate, dataSource: UITableViewDataSource, cell: AnyClass, id: String) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(cell, forCellReuseIdentifier: id)
    }
    
    
    func setCollectionView(collectionView: UICollectionView, delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource, cell: AnyClass, id: String) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.register(cell, forCellWithReuseIdentifier: id)
    }
}
