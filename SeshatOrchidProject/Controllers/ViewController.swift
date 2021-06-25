//
//  ViewController.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/18/21.
//

import UIKit
import SwiftUI
import Firebase

class ViewController: UITabBarController, UITabBarControllerDelegate {
    @Published var results = [Poem]()

    var db: Firestore!
    
    func getDocument() {
        Firestore.firestore().collection("poems").getDocuments { (snapshot, err) in
                  if let err = err {
                      print("Error getting documents: \(err)")
                  } else {
                      for document in snapshot!.documents {
//                         let docId = document.documentID
                        let poemsNSDictionary = document.data() as NSDictionary
                        //Testing: did Firebase supply the poems document
//                        print("poemsNSDictionary", poemsNSDictionary)
                        
                        // get JSON-ed poems
//                        if let jsonPoemData = try? JSONSerialization.data(withJSONObject: poemsNSDictionary, options: .prettyPrinted) {
//                        print("jsonPoemData ", jsonPoemData)
                            

                        let nsDictionaryData = try? JSONSerialization.data(
                            withJSONObject: poemsNSDictionary,
                            options: []
                        )
                        
//                        if let jsonPoemString = String(data: jsonPoemData, encoding: .utf8) {
//                        print("stringOfJSON", jsonPoemString)
//

                        // Swift Dictionary To Data.
                        do {
                            // need json for from:
                            let res = try JSONDecoder().decode(Poems.self, from: nsDictionaryData!)
                            self.results.append(contentsOf: res.poems)
                            print("results ", self.results)
                            print("results count: \(self.results.count)")
                        } catch{
                            print("My error message", error)
                        }
                        
//                        DispatchQueue.main.async {
//                            do {
//
//                            } catch {
//                                print("Error: \(error)")
//                                #if DEBUG
//                                fatalError()
//                                #endif
//                            }
                        //convert from NSDictionary to String
                        
//                        if let jsonPoemData = try? JSONSerialization.data(withJSONObject: poemsData, options: []) {
//                            if let jsonPoemString = String(data: jsonPoemData, encoding: .utf8) {
//                                print("dictFromJSON", jsonPoemString)
//
//                                // store poems data as [PoemModel]
//                                var poemModels: [PoemModel] = []
//                                for poem in jsonPoemString {
//                                    //put it into a model
//                                    let addPoem = PoemModel()
//                                    addPoem.id = 9999999
//                                    addPoem.title = poem["title"]
//                                    addPoem.poemText = poem["poemText"]
//                                    addPoem.tags = poem["tags"]
//
//                                    poemModels.append(addPoem)
//                                }
//                                 print(poemsData)
                            //}
                      // }

                        //}
                        
                        
                      }
                  }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        getDocument()
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
