//
//  HeaderItemView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct HeaderItemView: View {
    let items = IconModel.icons

    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            VStack {
                ForEach(items, id: \.id, content: { item in
                    Link(destination: URL(string: item.destination)!, label: {
                        Image(item.mainImage)
                        .resizable()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .scaledToFit()
                        .padding()
                    
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Spacer()
                        }
                    })
                })
            }
        }
    }
}
//struct HeaderItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderItemView()
//    }
//}
