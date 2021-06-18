//
//  ViewController.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import UIKit
import SwiftUI

class ViewController: UITabBarController, UITabBarControllerDelegate {
    let poemsView = UIHostingController(rootView: PoemsView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        addChild(poemsView)
        view.addSubview(poemsView.view)
        setupConstraints()
        
    }
    
    fileprivate func setupConstraints() {
        poemsView.view.translatesAutoresizingMaskIntoConstraints = false
        poemsView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        poemsView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        poemsView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        poemsView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

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
