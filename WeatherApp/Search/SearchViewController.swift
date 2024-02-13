//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 차소민 on 2/12/24.
//

import UIKit
//TODO: 검색 구현
final class SearchViewController: UIViewController {
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }
    
    var cityDataList: [City] = []
    var cityData: ((City) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "City"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        CityDataParsing.shared.load { cityResult in
            self.cityDataList = cityResult
            self.mainView.tableView.reloadData()
        }
        
        setTableView(tableView: mainView.tableView, delegate: self, dataSource: self, cell: SearchTableViewCell.self, id: SearchTableViewCell.id)
        
        mainView.searchBar.delegate = self
    }
    


}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.id, for: indexPath) as! SearchTableViewCell
        
        cell.configureCell(data: cityDataList, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             
        
        cityData?(self.cityDataList[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.lowercased() else { return }
        CityDataParsing.shared.load { cityList in
            let filterData = cityList.filter {
                $0.name.lowercased().contains(searchText)
            }
            self.cityDataList = filterData
            self.mainView.tableView.reloadData()
        }
    }
}
