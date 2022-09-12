// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetContinentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetContinents {
      continents {
        __typename
        code
        name
      }
    }
    """

  public let operationName: String = "GetContinents"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("continents", type: .nonNull(.list(.nonNull(.object(Continent.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(continents: [Continent]) {
      self.init(unsafeResultMap: ["__typename": "Query", "continents": continents.map { (value: Continent) -> ResultMap in value.resultMap }])
    }

    public var continents: [Continent] {
      get {
        return (resultMap["continents"] as! [ResultMap]).map { (value: ResultMap) -> Continent in Continent(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Continent) -> ResultMap in value.resultMap }, forKey: "continents")
      }
    }

    public struct Continent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Continent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: GraphQLID {
        get {
          return resultMap["code"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class GetCountriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetCountries($code: String!) {
      countries(filter: {continent: {eq: $code}}) {
        __typename
        code
        name
        capital
        emoji
        currency
        languages {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "GetCountries"

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("countries", arguments: ["filter": ["continent": ["eq": GraphQLVariable("code")]]], type: .nonNull(.list(.nonNull(.object(Country.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countries: [Country]) {
      self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var countries: [Country] {
      get {
        return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("capital", type: .scalar(String.self)),
        GraphQLField("emoji", type: .nonNull(.scalar(String.self))),
        GraphQLField("currency", type: .scalar(String.self)),
        GraphQLField("languages", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: GraphQLID, name: String, capital: String? = nil, emoji: String, currency: String? = nil, languages: [Language]) {
        self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "capital": capital, "emoji": emoji, "currency": currency, "languages": languages.map { (value: Language) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: GraphQLID {
        get {
          return resultMap["code"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var capital: String? {
        get {
          return resultMap["capital"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "capital")
        }
      }

      public var emoji: String {
        get {
          return resultMap["emoji"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "emoji")
        }
      }

      public var currency: String? {
        get {
          return resultMap["currency"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var languages: [Language] {
        get {
          return (resultMap["languages"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "languages")
        }
      }

      public struct Language: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Language"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Language", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
