//
//  ViewController.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import UIKit
import SwiftUI

class ViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Poems tab
        let poemsTab = PoemsViewController()
        let poemsTabBarItem = UITabBarItem(title: "Poems", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark"))
        
        poemsTab.tabBarItem = poemsTabBarItem
        
        
        // Create Stories tab
        let storiesTab = StoriesViewController()
        let storiesTabBarItem = UITabBarItem(title: "Stories", image: UIImage(systemName: "books.vertical"), selectedImage: UIImage(systemName: "books.vertical"))
        
        storiesTab.tabBarItem = storiesTabBarItem

        
        // Create performances tab
        let performancesTab = PerformancesViewController()
        let performancesTabBarItem = UITabBarItem(title: "Performances", image: UIImage(systemName: "tv"), selectedImage: UIImage(systemName: "tv"))
        
        performancesTab.tabBarItem = performancesTabBarItem
        
        
        self.viewControllers = [poemsTab, storiesTab, performancesTab]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
