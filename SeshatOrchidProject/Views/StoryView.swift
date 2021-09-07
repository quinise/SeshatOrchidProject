//
//  StoryView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        NavigationView {
            // search bar view - SearchBar()
            List {
                Text(story.storyText ?? "")
                Text(story.storyTags ?? "")
            }
            .navigationTitle(story.storyTitle ?? "")
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


//struct StoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryView()
//    }
//}
