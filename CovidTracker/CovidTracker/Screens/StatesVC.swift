//
//  StatesVC.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class StatesVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, State>!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureCollectionView()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StateCell.self, forCellWithReuseIdentifier: StateCell.reuseID)
    }

}

extension StatesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
