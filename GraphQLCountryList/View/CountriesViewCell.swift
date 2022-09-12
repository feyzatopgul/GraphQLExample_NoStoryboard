//
//  DetailTableViewCell.swift
//  GraphQLCountryList
//
//  Created by fyz on 8/12/22.
//

import UIKit

class CountriesViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        adjustConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let containerView = UIStackView()
    let cellView = CellView()
    let detailView = DetailView()
    
    var isDetailHidden = true
    
    func adjustConstraints() {
        selectionStyle = .none
       
        containerView.axis = .vertical
        contentView.addSubview(containerView)
        containerView.addArrangedSubview(cellView)
        containerView.addArrangedSubview(detailView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            isDetailHidden = !isDetailHidden
        }
        self.containerView.arrangedSubviews.last?.isHidden = isDetailHidden

    }
}


