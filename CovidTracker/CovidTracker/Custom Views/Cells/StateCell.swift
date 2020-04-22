//
//  StateCell.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class StateCell: UICollectionViewCell {
    static let reuseID = "StateCell"
    let stateIconView = UIImageView(frame: .zero)
    let stateNameLabel = CTTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(state: State) {
        stateNameLabel.text = state.state
        stateIconView.image = UIImage(named: state.state)
    }
    
    private func configure() {
        addSubviews(stateIconView, stateNameLabel)
        stateIconView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            stateIconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            stateIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            stateIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            stateIconView.heightAnchor.constraint(equalTo: stateIconView.widthAnchor),
            
            stateNameLabel.topAnchor.constraint(equalTo: stateIconView.bottomAnchor, constant: 12),
            stateNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            stateNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            stateNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
