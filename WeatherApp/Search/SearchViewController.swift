//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 차소민 on 2/12/24.
//

import UIKit
//TODO: 역 값 전달 꼭 연습하기
class SearchViewController: UIViewController {
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }
    
    var cityData: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "City"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        CityDataParsing.shared.load { cityResult in
            self.cityData = cityResult
        }
        
        setTableView(tableView: mainView.tableView, delegate: self, dataSource: self, cell: SearchTableViewCell.self, id: SearchTableViewCell.id)
    }
    


}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.id, for: indexPath) as! SearchTableViewCell
        
        cell.configureCell(data: cityData, index: indexPath.row)
        
        return cell
    }
    
}
