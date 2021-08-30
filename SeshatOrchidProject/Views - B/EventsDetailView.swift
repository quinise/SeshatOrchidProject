//
//  EventsDetailView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct EventsDetailView: View {
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
               Text("Events")
            }
            .navigationTitle("Events")
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

struct EventsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventsDetailView()
    }
}
