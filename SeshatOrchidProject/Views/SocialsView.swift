//
//  HeaderItemView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct SocialsView: View {
    let items = IconModel.icons

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.id, content: { item in
                    Link(destination: URL(string: item.destination)!, label: {
                        Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    })
                })
            }
            .navigationTitle("Follow Monia")
        }
    }
}
//struct SocialsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SocialsView()
//    }
//}
