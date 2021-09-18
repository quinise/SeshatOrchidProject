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
        List {
            Text(story.storyText)
                .font(.title);

            Text(story.storyTags)
                .italic()
        }
        .navigationTitle(story.storyTitle)
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

//struct StoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryView()
//    }
//}
