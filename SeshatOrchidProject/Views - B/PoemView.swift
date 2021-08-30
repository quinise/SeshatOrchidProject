//
//  PoemView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PoemView: View {
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
               Text("Test")
            }
            .navigationTitle("Poem Title")
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


struct PoemView_Previews: PreviewProvider {
    static var previews: some View {
        PoemView()
    }
}
