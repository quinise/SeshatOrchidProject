//
//  Event.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 7/13/21.
//

import SwiftUI

struct Event: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var location: String
    var date: Date
    var price: Double
    var contact: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "").lowercased()
    }
    
    // ToDo: should this be moved?
    static let events = [Event(id: UUID(), name: "The Earth", location: "5555 R Ave SW Atlanta, GA 99999", date: Date(), price: 7.50, contact: "https://github.com/quinise/SeshatOrchidProject"),
                         Event(id: UUID(), name: "The Sky", location: "4444 R Ave SW Atlanta, GA 99999", date: Date(), price: 8.50, contact: "https://github.com/quinise/MyGemTarot"),
                         Event(id: UUID(), name: "The Water", location: "33333 R Ave SW Atlanta, GA 99999", date: Date(), price: 9.50, contact: "https://github.com/quinise/Accord365_gin_development"),
                         Event(id: UUID(), name: "The Fire", location: "22222 R Ave SW Atlanta, GA 99999", date: Date(), price: 10.50, contact: "https://google.com")]
}

