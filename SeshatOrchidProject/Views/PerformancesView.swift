//
//  PerformancesView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PerformancesView: View {
    @State var performancesModels: [Performance] = []

    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            HStack {
                List (self.performancesModels) { (model) in
                    NavigationLink(destination: PerformanceView(performance: model)) {
                        HStack {
//                            Image(model.thumbnailImage)
//                                .resizable()
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
//                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text(model.performanceTitle)
                                Spacer()
                                Text(model.performanceTags)
                            }
                        }
                    }
                }
                
            }
            .onAppear(perform: { self.performancesModels = DBManager().getPerformances()})
            .navigationTitle("Performances")
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


//struct PerformancesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PerformancesView()
//    }
//}
