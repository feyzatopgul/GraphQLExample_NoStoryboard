//
//  DetailView.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/17/22.
//

import UIKit

class CellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellView()
    }
    
    let nameLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellView() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}


class DetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDetailView()
    }
    var emojiLabel = UILabel()
    
    var capitalLabel = UILabel()
    
    var currencyLabel = UILabel()
    
    var languageLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDetailView() {
        addSubview(emojiLabel)
        addSubview(capitalLabel)
        addSubview(currencyLabel)
        addSubview(languageLabel)
        
        emojiLabel.font = UIFont.systemFont(ofSize: 50)
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            emojiLabel.bottomAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: -100),
            emojiLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            emojiLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        capitalLabel.font = UIFont.systemFont(ofSize: 25)
        capitalLabel.textAlignment = .left
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            capitalLabel.topAnchor.constraint(equalTo: emojiLabel.topAnchor, constant: 10),
            capitalLabel.bottomAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: -100),
            capitalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            capitalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        currencyLabel.font = UIFont.systemFont(ofSize: 25)
        currencyLabel.textAlignment = .left
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: capitalLabel.topAnchor, constant: 10),
            currencyLabel.bottomAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: -100),
            currencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            currencyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        languageLabel.font = UIFont.systemFont(ofSize: 25)
        languageLabel.textAlignment = .left
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor, constant: 10),
            languageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            languageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            languageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
    }
}
