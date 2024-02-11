//
//  ViewController.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit

final class MainViewController: UIViewController {

    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tableView = mainView.fiveDaysView.tableView
        let collectionView = mainView.threeHourView.collectionView
        setTableView(tableView: tableView, delegate: self, dataSource: self, cell: FiveDaysTableViewCell.self, id: FiveDaysTableViewCell.id)
        setCollectionView(collectionView: collectionView, delegate: self, dataSource: self, cell: ThreeHourCollectionViewCell.self, id: ThreeHourCollectionViewCell.id)
        
        
        WeatherAPIManager.shared.callRequest(api: .current(appid: "91d1bdf68443fc402651e2aedc1d640c", id: 1846266), type: CurrentWeather.self) { result, error in
            print(result)
        }
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FiveDaysTableViewCell.id, for: indexPath) as! FiveDaysTableViewCell
        cell.dayLabel.text = "2/10"
        cell.iconImageView.image = UIImage(systemName: "star")
        cell.maxTempLabel.text = "10"
        cell.minTempLabel.text = "1"
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.id, for: indexPath) as! ThreeHourCollectionViewCell
        
    return cell
    }
    
    
}

