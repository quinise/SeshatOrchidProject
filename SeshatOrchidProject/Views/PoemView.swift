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
        List {
            Text(poem.poemText)
                .font(.title);
            Text(poem.tags)
                .italic()
                .font(.caption)
        }
        .navigationTitle(poem.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SocialsView()) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    .phoneOnlyStackNavigationView()
    }
}

//struct PoemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PoemView()
//    }
//}
