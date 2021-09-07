//
//  PoemView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PoemView: View {
    let poem: Poem
    
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
                Text(poem.poemText)
                Text(poem.tags)
            }
            .navigationTitle(poem.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: HeaderView()) {
//                        Image(systemName: "square.and.arrow.up")
//                    }
                }
            }
        }
    }
}


//struct PoemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PoemView()
//    }
//}
