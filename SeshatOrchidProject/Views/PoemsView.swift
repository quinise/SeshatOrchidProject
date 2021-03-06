//
//  PoemsView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PoemsView: View {
    @State var poemModels: [Poem] = []
    @State var searchText = ""
    let events: [Event]
    
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
                    List (self.poemModels.filter({ searchText.isEmpty ? true : $0.title.contains(searchText) ||  $0.tags.contains(searchText)})) { (model) in
                        NavigationLink(destination: PoemView(poem: model)) {
                            HStack {
                                Image(model.thumbnailImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                VStack(alignment: .leading) {
                                    Text(model.title)
                                        .font(.title);
                                    Spacer()
                                    Text(model.tags)
                                        .italic()
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .listStyle(SidebarListStyle())
                .padding(.bottom, 100)
            }
            .onAppear(perform: { self.poemModels = DBManager().getPoems()})
            .navigationTitle("Poetry")
            // Centers title, minimizes text
//            .navigationBarTitleDisplayMode(.inline)
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

// Facilitates good presentation in landscape mode
extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return
                AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

//struct PoemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PoemsView()
//    }
//}
