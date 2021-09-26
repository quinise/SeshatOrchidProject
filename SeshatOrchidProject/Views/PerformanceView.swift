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
        let url = URL(string: performance.performanceLocation)!
        List {
            VideoPlayer(player: AVPlayer(url: url))
                .scaledToFit()
            Text(performance.performanceTags )
                .italic()
                .font(.caption)
        }
        .navigationTitle(performance.performanceTitle )
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


//struct PerformanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PerformanceView()
//    }
//}
