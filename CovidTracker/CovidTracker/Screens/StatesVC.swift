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
    
    var states: [State] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, State>!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureCollectionView()
        configureDataSource()
        getStateData()
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
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, State>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, state) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StateCell.reuseID, for: indexPath) as! StateCell
            cell.set(state: state)
            return cell
        })
    }
    
    func getStateData() {
        NetworkManager.shared.getStateResults { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let states):
                self.states.append(contentsOf: states)
                self.updateData(on: self.states)
                
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Oops", message: error.rawValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func updateData(on states: [State]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, State>()
        snapshot.appendSections([.main])
        snapshot.appendItems(states)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }

}

extension StatesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let state = states[indexPath.item]
        
        let destinationVC = StateDetailVC()
        destinationVC.state = state
        
        let navController = UINavigationController(rootViewController: destinationVC)
        present(navController, animated: true, completion: nil)
    }
}
