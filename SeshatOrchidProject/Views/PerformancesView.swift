//
//  PerformancesView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct PerformancesView: View {
    @State var performancesModels: [Performance] = []
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
                    List (self.performancesModels.filter({ searchText.isEmpty ? true : $0.performanceTitle.contains(searchText) ||  $0.performanceTags.contains(searchText)})) { (model) in
                        NavigationLink(destination: PerformanceView(performance: model)) {
                            HStack {
    //                            Image(model.thumbnailImage)
    //                                .resizable()
    //                                .clipShape(Circle())
    //                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
    //                                .scaledToFit()
                                VStack(alignment: .leading) {
                                    Text(model.performanceTitle)
                                        .font(.title);
                                    Spacer()
                                    Text(model.performanceTags)
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
            .onAppear(perform: { self.performancesModels = DBManager().getPerformances()})
            .navigationTitle("Performances")
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

//struct PerformancesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PerformancesView()
//    }
//}
