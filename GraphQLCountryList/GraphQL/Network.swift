//
//  Network.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private init() {}
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
}
