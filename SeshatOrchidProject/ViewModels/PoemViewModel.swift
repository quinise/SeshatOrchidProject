////
////  PoemViewModel.swift
////  SeshatOrchidProject
////
////  Created by Devin Ercolano on 6/19/21.
////
//
//import Foundation
//import Combine
//
//
//class PoemViewModel: ObservableObject, Identifiable {
//    @Published var poem: Poem
//    private var cancellables: Set<AnyCancellable> = []
//    var id = ""
//    
//    init(poem: Poem) {
//        self.poem = poem
//        $poem
//            .compactMap { $0.id }
//            .assign(to: \.id, on: self)
//            .store(in: &cancellables)
//    }
//    
//    
//}
