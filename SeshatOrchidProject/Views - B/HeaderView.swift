//
//  HeaderView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
               Text("Test")
            }
            .navigationTitle("Header")
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}