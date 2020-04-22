//
//  StateDetailVC.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class StateDetailVC: UIViewController {
    let stateImageView = UIImageView()
    let stateNameLabel = CTTitleLabel(textAlignment: .left, fontSize: 30)
    let positiveCasesLabel = CTTitleLabel(textAlignment: .left, fontSize: 24)
    let totalTestedLabel = CTTitleLabel(textAlignment: .left, fontSize: 24)
    let totalDeathsLabel = CTTitleLabel(textAlignment: .left, fontSize: 24)
    let deathPercentageLabel = CTTitleLabel(textAlignment: .left, fontSize: 24)
    let dateModifiedLabel = CTSecondaryTitleLabel(textAlignment: .center, fontSize: 16)
    let stackView = UIStackView()
    
    var state: State!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureStackView()
        configureUI()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(stateNameLabel)
        stackView.addArrangedSubview(totalDeathsLabel)
        stackView.addArrangedSubview(positiveCasesLabel)
        stackView.addArrangedSubview(totalTestedLabel)
        stackView.addArrangedSubview(deathPercentageLabel)
    }
    
    private func configureUI() {
        view.addSubviews(stateImageView, stackView, dateModifiedLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
//            stateImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
//            stateImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            stateImageView.widthAnchor.constraint(equalTo: stateImageView.heightAnchor),
//            stateImageView.heightAnchor.constraint(equalToConstant: 20),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            dateModifiedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateModifiedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateModifiedLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            dateModifiedLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        stateImageView.image = UIImage(named: state.state)
        stateNameLabel.text = "State: \(state.state)"
        positiveCasesLabel.text = "Total Positive Cases: \(state.positive)"
        totalTestedLabel.text = "Total Tested: \(state.totalTestResults)"
        totalDeathsLabel.text = "Total Deaths: \(state.death ?? 0)"
        
        let deathPercentage = ((Double(state.death ?? 0)) / Double(state.positive))*100
        deathPercentageLabel.text = "Death Rate: " + String(format: "%.2f", deathPercentage) + "%"
        
        dateModifiedLabel.text = "Date Last Updated: \(state.dateModified)"
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
