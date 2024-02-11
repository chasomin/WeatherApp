//
//  ViewController.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {

    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    //var currentData = CurrentWeather(coord: Coordinate(lat: 0, lon: 0), weather: [], main: Main(from: <#T##Decoder#>), wind: Wind(speed: 0, gust: 0), rain: Rain(oneHour: 0), snow: Snow(oneHour: 0), clouds: Cloud(all: 0), id: 0, name: "")
    var data = FiveDayWeather(list: [])
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tableView = mainView.fiveDaysView.tableView
        let collectionView = mainView.threeHourView.collectionView
        setTableView(tableView: tableView, delegate: self, dataSource: self, cell: FiveDaysTableViewCell.self, id: FiveDaysTableViewCell.id)
        setCollectionView(collectionView: collectionView, delegate: self, dataSource: self, cell: ThreeHourCollectionViewCell.self, id: ThreeHourCollectionViewCell.id)
        
        
        WeatherAPIManager.shared.callRequest(api: .fiveDay(appid: "91d1bdf68443fc402651e2aedc1d640c", id: 1846266), type: FiveDayWeather.self) { result, error in
            if error == nil {
                guard let result else {
                    return
                }
                self.data = result
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
        }
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FiveDaysTableViewCell.id, for: indexPath) as! FiveDaysTableViewCell
        cell.configureCell(data: data, index: indexPath.row)
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

