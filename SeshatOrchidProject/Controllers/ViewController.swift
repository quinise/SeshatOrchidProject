//
//  ViewController.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import UIKit
import SwiftUI
//import Firebase

class ViewController: UITabBarController, UITabBarControllerDelegate {
//    @Published var results = [Poem]()
//
//    var db: Firestore!
//
//    func getDocument() {
//        Firestore.firestore().collection("poems").getDocuments { (snapshot, err) in
//                  if let err = err {
//                      print("Error getting documents: \(err)")
//                  } else {
//                      for document in snapshot!.documents {
////                         let docId = document.documentID
//                        let poemsNSDictionary = document.data() as NSDictionary
//                        //Testing: did Firebase supply the poems document
//                        print("poemsNSDictionary", poemsNSDictionary)
//                        self.results.append(Poem(id: document.documentID, title: document.get("title") as! String, poemText: document.get("poem") as! String, tags: document.get("tags") as! String))
//                        print("results", self.results)
//                      }
//                  }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
//        getDocument()
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
