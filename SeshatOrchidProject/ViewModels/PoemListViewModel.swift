////
////  PoemListViewModel.swift
////  SeshatOrchidProject
////
////  Created by Devin Ercolano on 6/19/21.
////
//
//import Foundation
//import Combine
//
//class PoemListViewModel: ObservableObject, Identifiable {
//    @Published var poemViewModels: [PoemViewModel] = []
//    private var cancellables: Set<AnyCancellable> = []
////    @Published var poemRepository = PoemRepository()
//    
//    init() {
//      // 1
//      poemRepository.$poems.map { cards in
//        cards.map(PoemViewModel.init)
//      }
//      // 2
//      .assign(to: \.poemViewModels, on: self)
//      // 3
//      .store(in: &cancellables)
//    }
//
//    
//}
