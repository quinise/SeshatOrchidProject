//
//  EventsDetailView.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 8/29/21.
//

import SwiftUI

struct EventsDetailView: View {
    let events = Event.events
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        HStack(alignment: .center) {
            List {
                ForEach(events, id: \.id, content: { event in
                    Image(event.name)
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .center) {
                        Text(event.name)
                        Text(event.location)
                        Text(dateFormatter.string(from: event.date))
                        let price: String = String(format: "$%.02f", event.price)
                        Text("\(price)")
                    }
                })
            }
        }
        .navigationTitle("Events")
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

//struct EventsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsDetailView()
//    }
//}
