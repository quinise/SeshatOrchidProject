//
//  PerformanceView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI
import AVKit

struct PerformanceView: View {
    let performance: Performance
    
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            let url = URL(string: performance.performanceLocation)!
            List {
                VideoPlayer(player: AVPlayer(url: url))
                    .scaledToFit()
                Text(performance.performanceTags )
            }
            .navigationTitle(performance.performanceTitle )
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


//struct PerformanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PerformanceView()
//    }
//}
