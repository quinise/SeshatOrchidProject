//
//  StoriesView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct StoriesView: View {
    @State var storyModels: [Story] = []
    
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            HStack {
                List (self.storyModels) { (model) in
                    NavigationLink(destination: StoryView(story: model)) {
                        HStack {
//                            Image(model.thumbnailImage)
//                                .resizable()
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
//                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text(model.storyTitle ?? "")
                                Spacer()
                                Text(model.storyTags ?? "")
                            }
                        }
                    }
                }
                
            }
            .onAppear(perform: { self.storyModels = DBManager().getStories() })
            .navigationTitle("Short Stories")
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


struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
