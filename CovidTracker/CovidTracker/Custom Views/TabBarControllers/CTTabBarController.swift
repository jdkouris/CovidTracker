//
//  CTTabBarController.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class CTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createSnapshotNC(), createStatesNC()]
    }
    
    func createSnapshotNC() -> UINavigationController {
        let snapshotVC = SnapshotVC()
        snapshotVC.title = "Snapshot"
        snapshotVC.tabBarItem = UITabBarItem(title: "Snapshot", image: UIImage(named: "world-map-dark"), tag: 0)
        
        return UINavigationController(rootViewController: snapshotVC)
    }
    
    func createStatesNC() -> UINavigationController {
        let statesVC = StatesVC()
        statesVC.title = "States"
        statesVC.tabBarItem = UITabBarItem(title: "States", image: UIImage(named: "usa"), tag: 1)
        
        return UINavigationController(rootViewController: statesVC)
    }

}
