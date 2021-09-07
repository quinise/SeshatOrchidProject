//
//  PoemsView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PoemsView: View {
    @State var poemModels: [Poem] = []
    
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            HStack {
                List (self.poemModels) { (model) in
                    NavigationLink(destination: PoemView(poem: model)) {
                        HStack {
                            Image(model.thumbnailImage)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text(model.title)
                                Spacer()
                                Text(model.tags)
                            }
                        }
                    }
                }
                
            }
            .onAppear(perform: { self.poemModels = DBManager().getPoems()})
            .navigationTitle("Poetry")
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

//struct PoemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PoemsView()
//    }
//}
