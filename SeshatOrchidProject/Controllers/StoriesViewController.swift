//
//  Tab2Controller.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import Foundation
import UIKit
import SwiftUI

class StoriesViewController: UIViewController {
    let storiesView = UIHostingController(rootView: StoriesView())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        self.title = "Stories"
        
        addChild(storiesView)
        view.addSubview(storiesView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        storiesView.view.translatesAutoresizingMaskIntoConstraints = false
        storiesView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storiesView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        storiesView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        storiesView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
