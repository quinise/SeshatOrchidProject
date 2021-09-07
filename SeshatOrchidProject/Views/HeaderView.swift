//
//  HeaderView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct HeaderView: View {
    let item: IconModel

    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            HStack {
                Image(item.mainImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))

                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                }
            }
        }
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView()
//    }
//}
