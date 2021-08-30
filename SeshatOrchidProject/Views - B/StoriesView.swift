//
//  StoriesView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
               Text("Test")
            }
            .navigationTitle("Short Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HeaderView()) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}


struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
