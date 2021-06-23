////
////  PoemRepository.swift
////  SeshatOrchidProject
////
////  Created by Devin Ercolano on 6/19/21.
////
//
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//import Combine
//
//class PoemRepository: ObservableObject {
//    private let path: String = "poems"
//    private let store = Firestore.firestore()
//    @Published var poems: [Poem] = []
//
//    init() {
//      get()
//    }
//    
//    func get() {
//      // 3
//      store.collection(path)
//        .addSnapshotListener { querySnapshot, error in
//          // 4
//          if let error = error {
//            print("Error getting poems: \(error.localizedDescription)")
//            return
//          }
//
//          // 5
//          self.poems = querySnapshot?.documents.compactMap { document in
//            // 6
//            try? document.data(as: Poem.self)
//          } ?? []
//
//        }
//    }
//}
