//
//  IconModels.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/23/21.
//

import SwiftUI

struct IconModel: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var location: String
    var destination: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "").lowercased()
    }
    
    static let icons = [IconModel(id: UUID(), name: "TwitterLogo", location: "Desktop", destination: "https://twitter.com/"), IconModel(id: UUID(), name: "instagramlogo", location: "Desktop", destination: "https://www.instagram.com/"), IconModel(id: UUID(), name: "facebooklogo", location: "Desktop", destination: "https://www.facebook.com/"), IconModel(id: UUID(), name: "udemylogo", location: "Desktop", destination: "https://www.udemy.com/"), IconModel(id: UUID(), name: "bloglogo", location: "Desktop", destination: "https://seshatorchid.blog/")]
}
