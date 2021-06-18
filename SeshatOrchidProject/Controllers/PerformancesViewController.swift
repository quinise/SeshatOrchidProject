//
//  PerformancesViewController.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import Foundation
import UIKit
import SwiftUI

class PerformancesViewController: UIViewController {
    let performancesView = UIHostingController(rootView: PerformancesView())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        self.title = "Performances"
        
        addChild(performancesView)
        view.addSubview(performancesView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        performancesView.view.translatesAutoresizingMaskIntoConstraints = false
        performancesView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        performancesView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        performancesView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        performancesView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
