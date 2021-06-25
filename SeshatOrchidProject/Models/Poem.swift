//
//  Poem.swift
//  SeshatOrchidProject
//
//  Created by Devin Ercolano on 6/19/21.
//
import Foundation


struct Poems: Codable{
    var poems: [Poem]
}

struct Poem: Codable {
    public var id: Int64? = 0
    public var title: String = ""
    public var poemText: String = ""
    public var tags: String = ""
    
    init(id: Int64, title: String, poemText: String, tags: String) {
        self.id = id
        self.title = title
        self.poemText = poemText
        self.tags = tags
    }

}
