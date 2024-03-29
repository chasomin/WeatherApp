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
    

    var fiveDaysData = FiveDayWeather(list: [])
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        
        let tableView = mainView.fiveDaysView.tableView
        let collectionView = mainView.threeHourView.collectionView
        setTableView(tableView: tableView, delegate: self, dataSource: self, cell: FiveDaysTableViewCell.self, id: FiveDaysTableViewCell.id)
        setCollectionView(collectionView: collectionView, delegate: self, dataSource: self, cell: ThreeHourCollectionViewCell.self, id: ThreeHourCollectionViewCell.id)
        
        request(id: 1835847)
        
        NotificationCenter.default.addObserver(self, selector: #selector(searchReceivedNotification), name: NSNotification.Name("SearchCity"), object: nil)
    }
    
    @objc func searchReceivedNotification(notification: NSNotification) {
        if let value = notification.userInfo?["cityID"] as? Int {
            self.request(id: value)
        }
    }
    
    @objc func searchButtonTapped() {
        
        let vc = SearchViewController()
//        vc.cityData = { data in
//            self.request(id: data.id)
//        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func request(id: Int) {
        
        let group = DispatchGroup()
        
        group.enter()
        WeatherAPIManager.shared.callRequest(api: .current(appid: APIkey.key, id: id), type: CurrentWeather.self) { result, error in
            if error == nil {
                guard let result else {
                    return
                }
                self.mainView.currentView.setData(data: result)
            }
            group.leave()
        }
        
        group.enter()
        WeatherAPIManager.shared.callRequest(api: .fiveDay(appid: APIkey.key, id: id), type: FiveDayWeather.self) { result, error in
            if error == nil {
                guard let result else {
                    return
                }
                self.fiveDaysData = result
            }
            group.leave()
        }

        group.notify(queue: .main) {
            let tableView = self.mainView.fiveDaysView.tableView
            let collectionView = self.mainView.threeHourView.collectionView
            tableView.reloadData()
            collectionView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiveDaysData.resultList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FiveDaysTableViewCell.id, for: indexPath) as! FiveDaysTableViewCell
        cell.configureCell(data: fiveDaysData, index: indexPath.row)
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fiveDaysData.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCollectionViewCell.id, for: indexPath) as! ThreeHourCollectionViewCell
        cell.configureCell(data: fiveDaysData, index: indexPath.item)
    return cell
    }
    
    
}

