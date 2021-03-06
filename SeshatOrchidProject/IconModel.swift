//
//  IconModels.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/23/21.
//
//  Model for icons in share header
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
}

extension IconModel {
    // ToDo: should this be moved?
    static var icons : [IconModel] {
                [
                    IconModel(id: UUID(), name: "twitter", location: "Desktop", destination: "https://twitter.com/"),
                    IconModel(id: UUID(), name: "instagram", location: "Desktop", destination: "https://www.instagram.com/"),
                    IconModel(id: UUID(), name: "facebook", location: "Desktop", destination: "https://www.facebook.com/"),
                    IconModel(id: UUID(), name: "udemy", location: "Desktop", destination: "https://www.udemy.com/"),
                    IconModel(id: UUID(), name: "blog", location: "Desktop", destination: "https://seshatorchid.blog/")
                ]
    }
}
