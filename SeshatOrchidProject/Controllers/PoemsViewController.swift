//
//  Tab1Controller.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import Foundation
import UIKit
import SwiftUI

class PoemsViewController: UIViewController {
    let poemsView = UIHostingController(rootView: PoemsView())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemPink
        self.title = "Poems"
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
