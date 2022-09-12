//
//  ContinentsViewCell.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import UIKit

class ContinentsViewCell: UITableViewCell {

    let continentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        continentLabel.translatesAutoresizingMaskIntoConstraints = false
        continentLabel.font = UIFont.systemFont(ofSize: 20)

        contentView.addSubview(continentLabel)
        NSLayoutConstraint.activate([
            continentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            continentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            continentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            continentLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
