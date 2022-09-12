//
//  CountriesListViewModel.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import Foundation

class CountriesListViewModel {
    
    var countries: [Country] = []
    
    func fetchCountries (code: String, completion: @escaping (_ countries: [Country]?, _ error: Error?)-> Void) {
        Network.shared.apollo.fetch(query: GetCountriesQuery(code: code)){[weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.countries {
                    self.countries = result.map({ country in
                        Country(code: country.code,
                                name: country.name,
                                capital: country.capital ?? "",
                                currency: country.currency ?? "",
                                emoji: country.emoji,
                                language: country.languages.isEmpty ? "" : country.languages[0].name!)
                    })
                }
                completion(self.countries, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
