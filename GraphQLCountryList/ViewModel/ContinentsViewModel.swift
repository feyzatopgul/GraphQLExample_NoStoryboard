//
//  ContinentsViewModel.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import Foundation

class ContinentsViewModel {
    
    var continents: [Continent] = []
    
    func fetchContinents(completion: @escaping (_ continents: [Continent]?,_ error: Error?)-> Void) {
        Network.shared.apollo.fetch(query: GetContinentsQuery()){ [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.continents {
                    self?.continents = result.map({ continent in
                        Continent(name: continent.name, code: continent.code)
                    })
                }
                completion(self?.continents, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
