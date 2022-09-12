//
//  ContinentsViewController.swift.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/9/22.
//

import UIKit

class ContinentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var continentsViewModel = ContinentsViewModel()
    
    var continentModel: [Continent] = []
    
    let continentsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure tableview
        configureContinentsVC()
        
        // Set up navigation title
        navigationItem.title = "Continents"
        
        // Fetch continents
        fetchData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContinentsViewCell", for: indexPath) as? ContinentsViewCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        cell.continentLabel.text = continentModel[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryListVC = CountryListViewController()
        countryListVC.code = continentModel[indexPath.row].code
        countryListVC.continent = continentModel[indexPath.row].name
        navigationController?.pushViewController(countryListVC, animated: true)
    }
    
    func configureContinentsVC(){
        
        //Add tableView to the view
        view.addSubview(continentsTableView)
        
        // Add constraints
        continentsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continentsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            continentsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            continentsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            continentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //Set delegate and datasource
        continentsTableView.delegate = self
        continentsTableView.dataSource = self
        
        //Register cells
        continentsTableView.register(ContinentsViewCell.self, forCellReuseIdentifier: "ContinentsViewCell")
    }
    
    func fetchData(){
        continentsViewModel.fetchContinents { [weak self] continents, error in
            if let continents = continents {
                self?.continentModel = continents
                DispatchQueue.main.async {
                    self?.continentsTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
