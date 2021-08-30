//
//  PerformanceDetailView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PerformanceDetailView: View {
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
               Text("Test")
            }
            .navigationTitle("Performance Title")
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


struct PerformanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceDetailView()
    }
}
