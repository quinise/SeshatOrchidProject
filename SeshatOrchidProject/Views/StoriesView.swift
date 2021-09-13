//
//  StoriesView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct StoriesView: View {
    @State var storyModels: [Story] = []
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                // Events bar
                NavigationLink(destination: EventsDetailView()) {
                Text("Events")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .opacity(0.3)
                }
                
                HStack {
                    List (self.storyModels.filter({ searchText.isEmpty ? true : $0.storyTitle.contains(searchText) ||  $0.storyTags.contains(searchText)})) { (model) in
                        NavigationLink(destination: StoryView(story: model)) {
                            HStack {
    //                            Image(model.thumbnailImage)
    //                                .resizable()
    //                                .clipShape(Circle())
    //                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
    //                                .scaledToFit()
                                VStack(alignment: .leading) {
                                    Text(model.storyTitle)
                                        .font(.title);
                                    Spacer()
                                    Text(model.storyTags)
                                        .italic()
                                }
                            }
                        }
                    }
                    
                }
            }
            .onAppear(perform: { self.storyModels = DBManager().getStories() })
            .navigationTitle("Short Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SocialsView()) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
        .phoneOnlyStackNavigationView()
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
