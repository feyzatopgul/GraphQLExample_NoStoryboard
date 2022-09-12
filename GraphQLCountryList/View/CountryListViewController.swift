//
//  CountryListViewController.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import UIKit

class CountryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let countriesTableView = UITableView()
    
    var countries:[Country] = []
    var countriesViewModel = CountriesListViewModel()
    var code: String = ""
    var continent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure tableview
        configureCountriesVC()
        
        // Set up navigation title
        navigationItem.title = continent
      
        //Fetch data
       fetchData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesViewCell", for: indexPath) as? CountriesViewCell else {return UITableViewCell()}
        
        cell.cellView.nameLabel.text = countries[indexPath.row].name
        cell.detailView.emojiLabel.text = countries[indexPath.row].emoji
        cell.detailView.capitalLabel.text = "Capital: \(countries[indexPath.row].capital)"
        cell.detailView.currencyLabel.text = "Currency: \(countries[indexPath.row].currency)"
        cell.detailView.languageLabel.text = "Language: \(countries[indexPath.row].language)"
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
  
    func configureCountriesVC(){
        
        //Add tableView to the view
        view.addSubview(countriesTableView)
        
        // Add constraints
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            countriesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            countriesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //Set delegate and datasource
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        //Register cells
        countriesTableView.register(CountriesViewCell.self, forCellReuseIdentifier: "CountriesViewCell")
    }
    func fetchData() {
        countriesViewModel.fetchCountries(code: code) {[weak self] countries, error in
            if let countries = countries {
                self?.countries = countries
                DispatchQueue.main.async {
                    self?.countriesTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
