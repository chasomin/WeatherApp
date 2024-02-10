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
        
        mainView.fiveDaysView.tableView.delegate = self
        mainView.fiveDaysView.tableView.dataSource = self
        mainView.fiveDaysView.tableView.register(FiveDaysTableViewCell.self, forCellReuseIdentifier: "1")
        mainView.threeHourView.collectionView.delegate = self
        mainView.threeHourView.collectionView.dataSource = self
        mainView.threeHourView.collectionView.register(ThreeHourCollectionViewCell.self, forCellWithReuseIdentifier: "2")
        
        
        mainView.scrollView.delegate = self
    //TODO: delegate 함수로 만들기~, 컬렉션뷰도 있음~
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as! FiveDaysTableViewCell
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "2", for: indexPath) as! ThreeHourCollectionViewCell
        
    return cell
    }
    
    
}

extension MainViewController: UIScrollViewDelegate {
//    scrollview
}
